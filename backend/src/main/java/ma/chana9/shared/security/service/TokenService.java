package ma.chana9.shared.security.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Base64;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.config.JwtConfig;
import ma.chana9.config.SecurityProperties;

import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserMapper;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.AuditConstants;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.constants.SecurityConstants;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.security.domain.RefreshToken;
import ma.chana9.shared.security.domain.TokenBlacklist;
import ma.chana9.shared.security.exception.InvalidTokenException;
import ma.chana9.shared.security.exception.TokenExpiredException;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.security.repository.TokenBlacklistRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.security.Keys;
import javax.crypto.SecretKey;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class TokenService {

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();
    private static final long GRACE_PERIOD_SECONDS = 15L;
    private static final String HASH_ALGORITHM = "SHA-256";
    private static final String BEARER_PREFIX = "Bearer ";
    private static final String HEADER_X_FORWARDED_FOR = "X-Forwarded-For";

    private final JwtConfig jwtConfig;
    private final SecurityProperties securityProperties;
    private final UserRepository userRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final TokenBlacklistRepository tokenBlacklistRepository;
    private final AuditService auditService;
    private final UserMapper userMapper;

    public String generateAccessToken(User user) {
        Instant now = Instant.now();
        return Jwts.builder()
                .subject(user.getId().toString())
                .claim(SecurityConstants.TOKEN_CLAIM_PHONE, user.getPhone())
                .claim(SecurityConstants.TOKEN_CLAIM_ROLE, user.getRole().name())
                .id(UUID.randomUUID().toString())
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusMillis(jwtConfig.getAccessExpiration())))
                .signWith(secretKey(), Jwts.SIG.HS512)
                .compact();
    }

    @Transactional
    public String generateRefreshToken(User user, HttpServletRequest request) {
        String rawToken = generateRawRefreshToken();
        RefreshToken refreshToken = RefreshToken.builder()
                .user(user)
                .tokenHash(hashToken(rawToken))
                .deviceFingerprint(computeDeviceFingerprint(request))
                .userAgent(request != null ? request.getHeader(HttpHeaders.USER_AGENT) : null)
                .ipAddress(extractIpAddress(request))
                .isRevoked(false)
                .expiresAt(LocalDateTime.ofInstant(Instant.now().plusMillis(jwtConfig.getRefreshExpiration()), ZoneId.systemDefault()))
                .build();
        refreshTokenRepository.save(refreshToken);
        enforceRefreshTokenLimit(user.getId());
        return rawToken;
    }

    @Transactional
    public AuthResponse rotateRefreshToken(String rawRefreshToken, HttpServletRequest request) {
        validateRawToken(rawRefreshToken);

        String tokenHash = hashToken(rawRefreshToken);
        RefreshToken refreshToken = refreshTokenRepository.findByTokenHash(tokenHash)
                .orElseThrow(InvalidTokenException::new);

        if (refreshToken.isRevoked()) {
            return handleRevokedToken(refreshToken, request);
        }

        validateTokenValidityAndDevice(refreshToken, request);

        refreshToken.setRevoked(true);
        refreshToken.setLastUsedAt(LocalDateTime.now());
        refreshTokenRepository.save(refreshToken);

        User user = refreshToken.getUser();
        String accessToken = generateAccessToken(user);
        String newRefreshToken = generateRefreshToken(user, request);
        auditService.logSuccess(AuditAction.TOKEN_REFRESHED, user.getId(), AuditConstants.TOKEN_ENTITY, refreshToken.getId().toString());
        return new AuthResponse(accessToken, newRefreshToken, jwtConfig.getAccessExpiration(), jwtConfig.getRefreshExpiration(), userMapper.toDto(user), MessageKeys.Auth.TOKEN_REFRESHED);
    }

    private void validateRawToken(String rawToken) {
        if (rawToken == null || rawToken.isBlank()) {
            throw new InvalidTokenException();
        }
    }

    private AuthResponse handleRevokedToken(RefreshToken refreshToken, HttpServletRequest request) {
        LocalDateTime lastUsed = refreshToken.getLastUsedAt();
        if (lastUsed != null && lastUsed.plusSeconds(GRACE_PERIOD_SECONDS).isAfter(LocalDateTime.now())) {
            User user = refreshToken.getUser();
            String accessToken = generateAccessToken(user);
            String newRefreshToken = generateRefreshToken(user, request);
            return new AuthResponse(accessToken, newRefreshToken, jwtConfig.getAccessExpiration(), jwtConfig.getRefreshExpiration(), userMapper.toDto(user), MessageKeys.Auth.TOKEN_REFRESHED);
        }

        UUID userId = refreshToken.getUser().getId();
        revokeAllUserTokens(userId, BlacklistReason.SUSPICIOUS_ACTIVITY);
        blacklistIncomingAccessToken(request);

        auditService.logFailure(AuditAction.TOKEN_REFRESHED, userId, AuditConstants.TOKEN_ENTITY, request);
        throw new InvalidTokenException();
    }

    private void blacklistIncomingAccessToken(HttpServletRequest request) {
        if (request == null) {
            return;
        }
        String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (authHeader != null && authHeader.startsWith(BEARER_PREFIX)) {
            try {
                blacklistAccessToken(authHeader.substring(BEARER_PREFIX.length()), BlacklistReason.SUSPICIOUS_ACTIVITY);
            } catch (Exception e) {
                log.debug("Impossible d'ajouter l'access token à la blacklist lors de la détection de vol : {}", e.getMessage());
            }
        }
    }

    private void validateTokenValidityAndDevice(RefreshToken refreshToken, HttpServletRequest request) {
        if (refreshToken.getExpiresAt().isBefore(LocalDateTime.now())) {
            throw new TokenExpiredException();
        }

        String requestFingerprint = computeDeviceFingerprint(request);
        if (!requestFingerprint.equals(refreshToken.getDeviceFingerprint())) {
            revokeAllUserTokens(refreshToken.getUser().getId(), BlacklistReason.SUSPICIOUS_ACTIVITY);
            throw new InvalidTokenException();
        }
    }

    @Transactional
    public void revokeRefreshToken(String rawToken, UUID userId, BlacklistReason reason) {
        validateRawToken(rawToken);
        RefreshToken refreshToken = refreshTokenRepository.findByTokenHash(hashToken(rawToken))
                .orElseThrow(InvalidTokenException::new);
        refreshToken.setRevoked(true);
        refreshToken.setLastUsedAt(LocalDateTime.now());
        refreshTokenRepository.save(refreshToken);
        auditService.logSuccess(AuditAction.TOKEN_REVOKED, userId, AuditConstants.REFRESH_TOKEN_ENTITY, reason.name());
    }

    @Transactional
    public void blacklistAccessToken(String rawAccessToken, BlacklistReason reason) {
        validateRawToken(rawAccessToken);
        Claims claims = extractClaimsAllowExpired(rawAccessToken);
        String tokenHash = claims.getId();
        if (tokenHash == null || tokenBlacklistRepository.existsByTokenHash(tokenHash)) {
            return;
        }

        UUID userId = extractUserIdFromClaims(claims);
        User user = userId != null ? userRepository.findById(userId).orElse(null) : null;
        TokenBlacklist blacklist = TokenBlacklist.builder()
                .tokenHash(tokenHash)
                .user(user)
                .reason(reason.name())
                .expiresAt(extractExpiration(claims))
                .build();
        tokenBlacklistRepository.save(blacklist);
        auditService.logSuccess(AuditAction.TOKEN_BLACKLISTED, userId, AuditConstants.TOKEN_ENTITY, tokenHash);
    }

    public boolean isAccessTokenBlacklisted(String rawAccessToken) {
        String tokenHash = extractJti(rawAccessToken);
        return tokenBlacklistRepository.existsByTokenHash(tokenHash);
    }

    public long accessTokenExpiresIn() {
        return jwtConfig.getAccessExpiration();
    }

    public long refreshTokenExpiresIn() {
        return jwtConfig.getRefreshExpiration();
    }

    @Transactional
    public void revokeAllUserTokens(UUID userId, BlacklistReason reason) {
        refreshTokenRepository.revokeAllByUserId(userId);
        auditService.logSuccess(AuditAction.ADMIN_ACTION, userId, AuditConstants.TOKEN_ENTITY, reason.name());
    }

    public UUID extractUserId(String token) {
        return UUID.fromString(parseClaims(token).getSubject());
    }

    public Role extractRole(String token) {
        return Role.valueOf(parseClaims(token).get(SecurityConstants.TOKEN_CLAIM_ROLE, String.class));
    }

    public String extractJti(String token) {
        return parseClaims(token).getId();
    }

    public boolean isTokenValid(String token) {
        try {
            Claims claims = parseClaims(token);
            return claims.getExpiration() != null && claims.getExpiration().toInstant().isAfter(Instant.now()) && !tokenBlacklistRepository.existsByTokenHash(claims.getId());
        } catch (JwtException | IllegalArgumentException exception) {
            log.trace("Token invalide : {}", exception.getMessage());
            return false;
        }
    }

    public String computeDeviceFingerprint(HttpServletRequest request) {
        String userAgent = normalize(request != null ? request.getHeader(HttpHeaders.USER_AGENT) : null);
        String acceptLanguage = normalize(request != null ? request.getHeader(HttpHeaders.ACCEPT_LANGUAGE) : null);
        return hashToken("%s|%s".formatted(userAgent, acceptLanguage));
    }

    public String hashToken(String rawToken) {
        try {
            MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
            byte[] bytes = digest.digest(rawToken.getBytes(StandardCharsets.UTF_8));
            return toHex(bytes);
        } catch (NoSuchAlgorithmException exception) {
            throw new IllegalStateException("Algorithme de hashage indisponible", exception);
        }
    }

    public Claims parseClaims(String token) {
        return Jwts.parser()
                .verifyWith(secretKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    private Claims extractClaimsAllowExpired(String token) {
        try {
            return parseClaims(token);
        } catch (ExpiredJwtException exception) {
            return exception.getClaims();
        }
    }

    private void enforceRefreshTokenLimit(UUID userId) {
        List<RefreshToken> tokens = refreshTokenRepository.findByUserIdAndIsRevokedFalse(userId);
        int maxActiveTokens = securityProperties.getMaxRefreshTokensPerUser();
        if (tokens.size() <= maxActiveTokens) {
            return;
        }
        tokens.stream()
                .sorted(Comparator.comparing(RefreshToken::getCreatedAt))
                .limit((long) tokens.size() - maxActiveTokens)
                .forEach(token -> {
                    token.setRevoked(true);
                    token.setLastUsedAt(LocalDateTime.now());
                    refreshTokenRepository.save(token);
                });
    }

    private UUID extractUserIdFromClaims(Claims claims) {
        String subject = claims.getSubject();
        if (subject == null) {
            return null;
        }
        return UUID.fromString(subject);
    }

    private LocalDateTime extractExpiration(Claims claims) {
        if (claims.getExpiration() == null) {
            return LocalDateTime.now();
        }
        return LocalDateTime.ofInstant(claims.getExpiration().toInstant(), ZoneId.systemDefault());
    }

    private SecretKey secretKey() {
        return Keys.hmacShaKeyFor(jwtConfig.getSecret().getBytes(StandardCharsets.UTF_8));
    }

    private String generateRawRefreshToken() {
        byte[] randomBytes = new byte[32];
        SECURE_RANDOM.nextBytes(randomBytes);
        return "%s.%s".formatted(UUID.randomUUID(), Base64.getUrlEncoder().withoutPadding().encodeToString(randomBytes));
    }

    private String extractIpAddress(HttpServletRequest request) {
        if (request == null) {
            return null;
        }
        String forwarded = request.getHeader(HEADER_X_FORWARDED_FOR);
        if (forwarded != null && !forwarded.isBlank()) {
            return forwarded.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }

    private String normalize(String value) {
        return value == null ? "" : value;
    }

    private String toHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder(bytes.length * 2);
        for (byte value : bytes) {
            builder.append(Character.forDigit((value >> 4) & 0xF, 16));
            builder.append(Character.forDigit(value & 0xF, 16));
        }
        return builder.toString();
    }
}