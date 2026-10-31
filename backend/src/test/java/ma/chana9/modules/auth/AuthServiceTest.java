package ma.chana9.modules.auth;

import jakarta.servlet.http.HttpServletRequest;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.PasswordLoginRequest;
import ma.chana9.modules.auth.dto.PasswordResetRequest;
import ma.chana9.modules.auth.dto.RefreshRequest;
import ma.chana9.modules.auth.dto.RegisterRequest;
import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.user.OtpCode;
import ma.chana9.modules.user.OtpCodeRepository;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserMapper;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.security.service.TokenService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private OtpCodeRepository otpCodeRepository;

    @Mock
    private TokenService tokenService;

    @Mock
    private OtpService otpService;

    @Mock
    private MessageResolver messageResolver;

    @Mock
    private AuditService auditService;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private UserMapper userMapper;

    @Mock
    private HttpServletRequest httpRequest;

    @InjectMocks
    private AuthService authService;

    @Test
    void devraitInscrireUnUtilisateurEtGenererLesTokens() {
        // Arrange
        UUID userId = UUID.randomUUID();
        RegisterRequest request = new RegisterRequest("+212600000000", "password-securise", "Acheteur");
        User user = user(userId, request.phone());
        UserDTO userDto = org.mockito.Mockito.mock(UserDTO.class);

        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.empty());
        when(passwordEncoder.encode(request.password())).thenReturn("hash-mot-de-passe");
        when(userMapper.toUser(request, "hash-mot-de-passe")).thenReturn(user);
        when(userRepository.save(user)).thenReturn(user);
        when(tokenService.generateAccessToken(user)).thenReturn("access-token");
        when(tokenService.generateRefreshToken(user, httpRequest)).thenReturn("refresh-token");
        when(tokenService.accessTokenExpiresIn()).thenReturn(900L);
        when(tokenService.refreshTokenExpiresIn()).thenReturn(604800L);
        when(userMapper.toDto(user)).thenReturn(userDto);

        // Act
        AuthResponse resultat = authService.register(request, httpRequest);

        // Assert
        ArgumentCaptor<User> userCaptor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(userCaptor.capture());
        assertThat(userCaptor.getValue()).isSameAs(user);
        assertThat(resultat.accessToken()).isEqualTo("access-token");
        assertThat(resultat.refreshToken()).isEqualTo("refresh-token");
        assertThat(resultat.accessTokenExpiresIn()).isEqualTo(900L);
        assertThat(resultat.refreshTokenExpiresIn()).isEqualTo(604800L);
        assertThat(resultat.user()).isSameAs(userDto);
        verify(auditService).logSuccess(AuditAction.REGISTER, userId);
    }

    @Test
    void devraitRefuserUneInscriptionAvecUnTelephoneDejaUtilise() {
        // Arrange
        RegisterRequest request = new RegisterRequest("+212600000000", "password-securise", "Acheteur");
        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.of(user(UUID.randomUUID(), request.phone())));

        // Act / Assert
        assertThatThrownBy(() -> authService.register(request, httpRequest))
                .isInstanceOf(ApiException.class)
                .extracting("messageKey")
                .isEqualTo(ErrorKeys.Auth.PHONE_ALREADY_EXISTS);

        verify(userRepository, never()).save(any(User.class));
        verify(tokenService, never()).generateAccessToken(any(User.class));
    }

    @Test
    void devraitConnecterUnUtilisateurAvecDesIdentifiantsValides() {
        // Arrange
        UUID userId = UUID.randomUUID();
        PasswordLoginRequest request = new PasswordLoginRequest("+212600000000", "mot-de-passe");
        User user = user(userId, request.phone());
        UserDTO userDto = org.mockito.Mockito.mock(UserDTO.class);

        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.of(user));
        user.setPasswordHash("hash");
        when(passwordEncoder.matches(request.password(), "hash")).thenReturn(true);
        when(tokenService.generateAccessToken(user)).thenReturn("access-token");
        when(tokenService.generateRefreshToken(user, httpRequest)).thenReturn("refresh-token");
        when(tokenService.accessTokenExpiresIn()).thenReturn(900L);
        when(tokenService.refreshTokenExpiresIn()).thenReturn(604800L);
        when(userMapper.toDto(user)).thenReturn(userDto);
        when(messageResolver.resolve(any(String.class))).thenReturn("Connexion réussie");

        // Act
        AuthResponse resultat = authService.login(request, httpRequest);

        // Assert
        assertThat(resultat.accessToken()).isEqualTo("access-token");
        assertThat(resultat.refreshToken()).isEqualTo("refresh-token");
        assertThat(resultat.user()).isSameAs(userDto);
        assertThat(resultat.message()).isEqualTo("Connexion réussie");
        verify(auditService).logSuccess(AuditAction.LOGIN_SUCCESS, userId);
    }

    @Test
    void devraitRefuserUneConnexionAvecUnMotDePasseIncorrect() {
        // Arrange
        UUID userId = UUID.randomUUID();
        PasswordLoginRequest request = new PasswordLoginRequest("+212600000000", "mauvais-mot-de-passe");
        User user = user(userId, request.phone());
        user.setPasswordHash("hash");
        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.of(user));
        when(passwordEncoder.matches(request.password(), "hash")).thenReturn(false);

        // Act / Assert
        assertThatThrownBy(() -> authService.login(request, httpRequest))
                .isInstanceOf(ApiException.class)
                .extracting("messageKey")
                .isEqualTo(ErrorKeys.Auth.INVALID_CREDENTIALS);

        verify(auditService).logFailure(eq(AuditAction.LOGIN_FAILED), eq(userId), eq("Bad password"), eq(httpRequest));
        verify(tokenService, never()).generateAccessToken(any(User.class));
    }

    @Test
    void devraitReinitialiserLeMotDePasseAvecUnOtpValide() {
        // Arrange
        UUID userId = UUID.randomUUID();
        PasswordResetRequest request = new PasswordResetRequest("+212600000000", "123456", "nouveau-mot-de-passe");
        User user = user(userId, request.phone());
        OtpCode otpCode = OtpCode.builder().phone(request.phone()).code(request.otp()).used(false).build();

        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.of(user));
        when(otpCodeRepository.findTopByPhoneAndUsedFalseOrderByCreatedAtDesc(request.phone()))
                .thenReturn(Optional.of(otpCode));
        when(otpService.isValid(otpCode, request.otp())).thenReturn(true);
        when(passwordEncoder.encode(request.newPassword())).thenReturn("nouveau-hash");
        when(messageResolver.resolve(any(String.class))).thenReturn("Mot de passe réinitialisé");

        // Act
        AuthResponse resultat = authService.resetPassword(request, httpRequest);

        // Assert
        assertThat(otpCode.getUsed()).isTrue();
        assertThat(user.getPasswordHash()).isEqualTo("nouveau-hash");
        assertThat(resultat.message()).isEqualTo("Mot de passe réinitialisé");
        verify(otpCodeRepository).save(otpCode);
        verify(userRepository).save(user);
        verify(tokenService).revokeAllUserTokens(userId, BlacklistReason.PASSWORD_RESET);
        verify(auditService).logSuccess(AuditAction.PASSWORD_RESET, userId);
    }

    @Test
    void devraitRefuserLaReinitialisationAvecUnOtpInvalide() {
        // Arrange
        UUID userId = UUID.randomUUID();
        PasswordResetRequest request = new PasswordResetRequest("+212600000000", "000000", "nouveau-mot-de-passe");
        User user = user(userId, request.phone());
        OtpCode otpCode = OtpCode.builder().phone(request.phone()).code("123456").used(false).build();

        when(userRepository.findByPhone(request.phone())).thenReturn(Optional.of(user));
        when(otpCodeRepository.findTopByPhoneAndUsedFalseOrderByCreatedAtDesc(request.phone()))
                .thenReturn(Optional.of(otpCode));
        when(otpService.isValid(otpCode, request.otp())).thenReturn(false);
        when(messageResolver.resolve(ErrorKeys.Auth.INVALID_OTP)).thenReturn("OTP invalide");

        // Act / Assert
        assertThatThrownBy(() -> authService.resetPassword(request, httpRequest))
                .isInstanceOf(ApiException.class)
                .extracting("messageKey")
                .isEqualTo(ErrorKeys.Auth.INVALID_OTP);

        verify(otpCodeRepository, never()).save(any(OtpCode.class));
        verify(userRepository, never()).save(any(User.class));
        verify(tokenService, never()).revokeAllUserTokens(any(UUID.class), any(BlacklistReason.class));
    }

    @Test
    void devraitDeconnecterEnInvalidantLesDeuxTokens() {
        // Arrange
        UUID userId = UUID.randomUUID();

        // Act
        authService.logout("access-token", "refresh-token", userId, httpRequest);

        // Assert
        verify(tokenService).blacklistAccessToken("access-token", BlacklistReason.LOGOUT);
        verify(tokenService).revokeRefreshToken("refresh-token", userId, BlacklistReason.LOGOUT);
        verify(auditService).logSuccess(AuditAction.LOGOUT, userId);
    }

    private static User user(UUID id, String phone) {
        User user = new User();
        user.setId(id);
        user.setPhone(phone);
        return user;
    }
}
