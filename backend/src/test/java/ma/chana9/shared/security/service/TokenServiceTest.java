package ma.chana9.shared.security.service;

import io.jsonwebtoken.Claims;
import ma.chana9.config.JwtConfig;
import ma.chana9.config.SecurityProperties;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserMapper;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.SecurityConstants;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.security.repository.TokenBlacklistRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
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
    void generateAccessToken_shouldContainUserClaimsAndBeValid() {
        User user = user(UUID.randomUUID(), "0612345678");

        String token = tokenService.generateAccessToken(user);
        Claims claims = tokenService.parseClaims(token);

        assertEquals(user.getId().toString(), claims.getSubject());
        assertEquals(user.getPhone(), claims.get(SecurityConstants.TOKEN_CLAIM_PHONE, String.class));
        assertEquals(user.getRole().name(), claims.get(SecurityConstants.TOKEN_CLAIM_ROLE, String.class));
        assertTrue(tokenService.isTokenValid(token));
    }

    @Test
    void generateAccessToken_shouldCreateDifferentJtiForEachToken() {
        User user = user(UUID.randomUUID(), "0612345678");

        String firstToken = tokenService.generateAccessToken(user);
        String secondToken = tokenService.generateAccessToken(user);

        assertNotEquals(tokenService.extractJti(firstToken), tokenService.extractJti(secondToken));
    }

    @Test
    void hashToken_shouldBeDeterministicAndFingerprintShouldDependOnHeaders() {
        assertEquals(tokenService.hashToken("value"), tokenService.hashToken("value"));
        assertNotEquals(tokenService.hashToken("value"), tokenService.hashToken("other"));

        assertEquals(tokenService.computeDeviceFingerprint(null), tokenService.computeDeviceFingerprint(null));
    }

    @Test
    void isTokenValid_whenJtiIsBlacklisted_shouldReturnFalse() {
        User user = user(UUID.randomUUID(), "0612345678");
        String token = tokenService.generateAccessToken(user);
        when(tokenBlacklistRepository.existsByTokenHash(tokenService.extractJti(token))).thenReturn(true);

        assertFalse(tokenService.isTokenValid(token));
    }

    private User user(UUID id, String phone) {
        User user = new User();
        user.setId(id);
        user.setPhone(phone);
        user.setRole(ma.chana9.shared.enums.Role.USER);
        return user;
    }
}