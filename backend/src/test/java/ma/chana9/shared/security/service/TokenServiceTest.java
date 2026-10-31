package ma.chana9.shared.security.service;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import ma.chana9.config.JwtConfig;
import ma.chana9.config.SecurityProperties;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserMapper;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.SecurityConstants;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.security.domain.RefreshToken;
import ma.chana9.shared.security.domain.TokenBlacklist;
import ma.chana9.shared.security.exception.InvalidTokenException;
import ma.chana9.shared.security.exception.TokenExpiredException;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.security.repository.TokenBlacklistRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class TokenServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private RefreshTokenRepository refreshTokenRepository;
    @Mock
    private TokenBlacklistRepository tokenBlacklistRepository;
    @Mock
    private AuditService auditService;
    @Mock
    private UserMapper userMapper;

    private TokenService tokenService;

    @BeforeEach
    void setUp() {
        JwtConfig jwtConfig = new JwtConfig();
        jwtConfig.setSecret("a-secret-that-is-long-enough-for-hs512-signing-and-tests-1234567890");
        jwtConfig.setAccessExpiration(60_000);
        jwtConfig.setRefreshExpiration(120_000);

        SecurityProperties securityProperties = new SecurityProperties();
        securityProperties.setMaxRefreshTokensPerUser(3);
        tokenService = new TokenService(jwtConfig, securityProperties, userRepository,
                refreshTokenRepository, tokenBlacklistRepository, auditService, userMapper);
    }

    @Test
    void devraitGenererUnTokenAvecLesClaimsUtilisateurEtValide() {
        // Arrange
        User user = user(UUID.randomUUID(), "0612345678");

        // Act
        String token = tokenService.generateAccessToken(user);
        Claims claims = tokenService.parseClaims(token);

        // Assert
        assertThat(claims.getSubject()).isEqualTo(user.getId().toString());
        assertThat(claims.get(SecurityConstants.TOKEN_CLAIM_PHONE, String.class)).isEqualTo(user.getPhone());
        assertThat(claims.get(SecurityConstants.TOKEN_CLAIM_ROLE, String.class)).isEqualTo(user.getRole().name());
        assertThat(tokenService.isTokenValid(token)).isTrue();
    }

    @Test
    void devraitGenererUnJtiDifferentPourChaqueToken() {
        // Arrange
        User user = user(UUID.randomUUID(), "0612345678");

        // Act
        String firstToken = tokenService.generateAccessToken(user);
        String secondToken = tokenService.generateAccessToken(user);

        // Assert
        assertThat(tokenService.extractJti(firstToken)).isNotEqualTo(tokenService.extractJti(secondToken));
    }

    @Test
    void devraitHasherDeManiereDeterministeEtDifferencierLesAppareils() {
        // Arrange
        HttpServletRequest firstRequest = request("agent-a", "fr-FR");
        HttpServletRequest secondRequest = request("agent-b", "fr-FR");

        // Act
        String firstFingerprint = tokenService.computeDeviceFingerprint(firstRequest);
        String secondFingerprint = tokenService.computeDeviceFingerprint(secondRequest);

        // Assert
        assertThat(tokenService.hashToken("value")).isEqualTo(tokenService.hashToken("value"));
        assertThat(tokenService.hashToken("value")).isNotEqualTo(tokenService.hashToken("other"));
        assertThat(firstFingerprint).isNotEqualTo(secondFingerprint);
        assertThat(tokenService.computeDeviceFingerprint(null))
                .isEqualTo(tokenService.computeDeviceFingerprint(null));
    }

    @Test
    void devraitInvaliderUnTokenDontLeJtiEstBlacklist() {
        // Arrange
        User user = user(UUID.randomUUID(), "0612345678");
        String token = tokenService.generateAccessToken(user);
        when(tokenBlacklistRepository.existsByTokenHash(tokenService.extractJti(token))).thenReturn(true);

        // Act
        boolean resultat = tokenService.isTokenValid(token);

        // Assert
        assertThat(resultat).isFalse();
    }

    @Test
    void devraitRefuserUnRefreshTokenVide() {
        // Arrange
        String blankToken = " ";

        // Act / Assert
        assertThatThrownBy(() -> tokenService.rotateRefreshToken(blankToken, null))
                .isInstanceOf(InvalidTokenException.class)
                .hasFieldOrPropertyWithValue("status", HttpStatus.UNAUTHORIZED);

        verify(refreshTokenRepository, never()).findByTokenHash(any(String.class));
    }

    @Test
    void devraitRefuserUnRefreshTokenExpire() {
        // Arrange
        User user = user(UUID.randomUUID(), "0612345678");
        HttpServletRequest request = request("agent", "fr-FR");
        String rawToken = "refresh-token";
        RefreshToken refreshToken = RefreshToken.builder()
                .user(user)
                .tokenHash(tokenService.hashToken(rawToken))
                .deviceFingerprint(tokenService.computeDeviceFingerprint(request))
                .expiresAt(LocalDateTime.now().minusMinutes(1))
                .isRevoked(false)
                .build();
        when(refreshTokenRepository.findByTokenHash(tokenService.hashToken(rawToken)))
                .thenReturn(Optional.of(refreshToken));

        // Act / Assert
        assertThatThrownBy(() -> tokenService.rotateRefreshToken(rawToken, request))
                .isInstanceOf(TokenExpiredException.class)
                .hasFieldOrPropertyWithValue("status", HttpStatus.UNAUTHORIZED);

        verify(refreshTokenRepository, never()).save(refreshToken);
    }

    @Test
    void devraitRevoquerTousLesTokensSiEmpreinteAppareilChange() {
        // Arrange
        UUID userId = UUID.randomUUID();
        User user = user(userId, "0612345678");
        HttpServletRequest trustedRequest = request("trusted-agent", "fr-FR");
        HttpServletRequest alteredRequest = request("unknown-agent", "fr-FR");
        String rawToken = "refresh-token";
        RefreshToken refreshToken = RefreshToken.builder()
                .user(user)
                .tokenHash(tokenService.hashToken(rawToken))
                .deviceFingerprint(tokenService.computeDeviceFingerprint(trustedRequest))
                .expiresAt(LocalDateTime.now().plusMinutes(5))
                .isRevoked(false)
                .build();
        when(refreshTokenRepository.findByTokenHash(tokenService.hashToken(rawToken)))
                .thenReturn(Optional.of(refreshToken));

        // Act / Assert
        assertThatThrownBy(() -> tokenService.rotateRefreshToken(rawToken, alteredRequest))
                .isInstanceOf(InvalidTokenException.class);

        verify(refreshTokenRepository).revokeAllByUserId(userId);
        verify(refreshTokenRepository, never()).save(refreshToken);
    }

    @Test
    void devraitPersisterUneBlacklistPourUnAccessTokenUneSeuleFois() {
        // Arrange
        User user = user(UUID.randomUUID(), "0612345678");
        String accessToken = tokenService.generateAccessToken(user);
        String jti = tokenService.extractJti(accessToken);
        when(tokenBlacklistRepository.existsByTokenHash(jti)).thenReturn(false);
        when(userRepository.findById(user.getId())).thenReturn(Optional.of(user));

        // Act
        tokenService.blacklistAccessToken(accessToken, BlacklistReason.LOGOUT);

        // Assert
        ArgumentCaptor<TokenBlacklist> blacklistCaptor = ArgumentCaptor.forClass(TokenBlacklist.class);
        verify(tokenBlacklistRepository).save(blacklistCaptor.capture());
        TokenBlacklist blacklist = blacklistCaptor.getValue();
        assertThat(blacklist.getTokenHash()).isEqualTo(jti);
        assertThat(blacklist.getReason()).isEqualTo(BlacklistReason.LOGOUT.name());
        verify(auditService).logSuccess(any(), eq(user.getId()), any(String.class), eq(jti));
    }

    @Test
    void devraitRevoquerTousLesTokensUtilisateurEtAuditerLaRaison() {
        // Arrange
        UUID userId = UUID.randomUUID();

        // Act
        tokenService.revokeAllUserTokens(userId, BlacklistReason.PASSWORD_RESET);

        // Assert
        verify(refreshTokenRepository).revokeAllByUserId(userId);
        verify(auditService).logSuccess(any(), eq(userId), any(String.class), eq(BlacklistReason.PASSWORD_RESET.name()));
    }

    private HttpServletRequest request(String userAgent, String language) {
        HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getHeader(HttpHeaders.USER_AGENT)).thenReturn(userAgent);
        when(request.getHeader(HttpHeaders.ACCEPT_LANGUAGE)).thenReturn(language);
        return request;
    }

    private User user(UUID id, String phone) {
        User user = new User();
        user.setId(id);
        user.setPhone(phone);
        user.setRole(ma.chana9.shared.enums.Role.USER);
        return user;
    }
}
