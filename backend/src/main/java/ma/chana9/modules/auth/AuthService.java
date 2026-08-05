package ma.chana9.modules.auth;

import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.PasswordLoginRequest;
import ma.chana9.modules.auth.dto.PasswordResetRequest;
import ma.chana9.modules.auth.dto.RefreshRequest;
import ma.chana9.modules.auth.dto.RegisterRequest;
import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.user.*;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.AuditConstants;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.security.service.TokenService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

	private final UserRepository userRepository;
	private final OtpCodeRepository otpCodeRepository;
	private final TokenService tokenService;
	private final OtpService otpService;
	private final MessageResolver messageResolver;
	private final AuditService auditService;
	private final PasswordEncoder passwordEncoder;
	private final UserMapper userMapper;

	public AuthResponse register(RegisterRequest request, HttpServletRequest httpRequest) {
		if (userRepository.findByPhone(request.phone()).isPresent()) {
			throw new ApiException(ErrorKeys.Auth.PHONE_ALREADY_EXISTS);
		}

		User user = userMapper.toUser(request, passwordEncoder.encode(request.password()));
		userRepository.save(user);

		auditService.logSuccess(AuditAction.REGISTER, user.getId());

		var accessToken = tokenService.generateAccessToken(user);
		var refreshToken = tokenService.generateRefreshToken(user, httpRequest);

		return new AuthResponse(
				accessToken,
				refreshToken,
				tokenService.accessTokenExpiresIn(),
				tokenService.refreshTokenExpiresIn(),
				userMapper.toDto(user),
				null
		);
	}

	public AuthResponse login(PasswordLoginRequest request, HttpServletRequest httpRequest) {
		User user = userRepository.findByPhone(request.phone())
				.orElseThrow(() -> {
					auditService.logFailure(AuditAction.LOGIN_FAILED, null,
							"Phone not found: " + request.phone(), httpRequest);
					return new ApiException(ErrorKeys.Auth.INVALID_CREDENTIALS);
				});

		if (user.getPasswordHash() == null ||
				!passwordEncoder.matches(request.password(), user.getPasswordHash())) {
			auditService.logFailure(AuditAction.LOGIN_FAILED, user.getId(), "Bad password", httpRequest);
			throw new ApiException(ErrorKeys.Auth.INVALID_CREDENTIALS);
		}

		String accessToken  = tokenService.generateAccessToken(user);
		String refreshToken = tokenService.generateRefreshToken(user, httpRequest);
		auditService.logSuccess(AuditAction.LOGIN_SUCCESS, user.getId());

		return AuthResponse.builder()
				.accessToken(accessToken)
				.refreshToken(refreshToken)
				.user(userMapper.toDto(user))
				.accessTokenExpiresIn(tokenService.accessTokenExpiresIn())
				.refreshTokenExpiresIn(tokenService.refreshTokenExpiresIn())
				.message(messageResolver.resolve(MessageKeys.Auth.LOGIN_SUCCESS))
				.build();
	}

	public AuthResponse sendResetOtp(LoginRequest request, HttpServletRequest httpRequest) {
		userRepository.findByPhone(request.phone())
				.orElseThrow(() -> new ApiException(ErrorKeys.Auth.PHONE_NOT_FOUND));

		try {
			OtpCode otpCode = otpService.createOtp(request.phone());
			otpCodeRepository.save(otpCode);
			auditService.logSuccess(AuditAction.OTP_SENT, null, AuditConstants.USER_ENTITY, request.phone());
			return AuthResponse.message(messageResolver.resolve(MessageKeys.Auth.OTP_SENT));
		} catch (RuntimeException exception) {
			auditService.logFailure(AuditAction.OTP_FAILED, null, exception.getMessage(), httpRequest);
			throw exception;
		}
	}

	public AuthResponse resetPassword(PasswordResetRequest request, HttpServletRequest httpRequest) {
		User user = userRepository.findByPhone(request.phone())
				.orElseThrow(() -> new ApiException(ErrorKeys.Auth.PHONE_NOT_FOUND));

		OtpCode otpCode = otpCodeRepository
				.findTopByPhoneAndUsedFalseOrderByCreatedAtDesc(request.phone())
				.filter(code -> otpService.isValid(code, request.otp()))
				.orElseThrow(() -> {
					auditService.logFailure(AuditAction.OTP_FAILED, user.getId(),
							messageResolver.resolve(ErrorKeys.Auth.INVALID_OTP), httpRequest);
					return new ApiException(ErrorKeys.Auth.INVALID_OTP);
				});

		otpCode.setUsed(true);
		otpCodeRepository.save(otpCode);

		user.setPasswordHash(passwordEncoder.encode(request.newPassword()));
		userRepository.save(user);

		tokenService.revokeAllUserTokens(user.getId(), BlacklistReason.PASSWORD_RESET);
		auditService.logSuccess(AuditAction.PASSWORD_RESET, user.getId());

		return AuthResponse.message(messageResolver.resolve(MessageKeys.Auth.PASSWORD_RESET_SUCCESS));
	}

	public AuthResponse refreshToken(RefreshRequest request, HttpServletRequest httpRequest) {
		return tokenService.rotateRefreshToken(request.refreshToken(), httpRequest);
	}

	public void logout(String rawAccessToken, String rawRefreshToken, UUID userId, HttpServletRequest request) {
		tokenService.blacklistAccessToken(rawAccessToken, BlacklistReason.LOGOUT);
		tokenService.revokeRefreshToken(rawRefreshToken, userId, BlacklistReason.LOGOUT);
		auditService.logSuccess(AuditAction.LOGOUT, userId);
	}
}