package ma.chana9.modules.auth;

import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.OtpRequest;
import ma.chana9.modules.auth.dto.RefreshRequest;
import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.user.OtpCode;
import ma.chana9.modules.user.OtpCodeRepository;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.AuditConstants;
import ma.chana9.shared.security.service.TokenService;

@Service
@RequiredArgsConstructor
public class AuthService {

	private final UserRepository userRepository;
	private final OtpCodeRepository otpCodeRepository;
	private final TokenService tokenService;
	private final OtpService otpService;
	private final MessageResolver messageResolver;
	private final AuditService auditService;

    public AuthResponse sendOtp(LoginRequest request, HttpServletRequest httpRequest) {
		try {
			OtpCode otpCode = otpService.createOtp(request.getPhone());
			otpCodeRepository.save(otpCode);
			auditService.logSuccess(AuditAction.OTP_SENT, null, AuditConstants.USER_ENTITY, request.getPhone());
			return AuthResponse.message(messageResolver.resolve(MessageKeys.Auth.OTP_SENT));
		} catch (RuntimeException exception) {
			auditService.logFailure(AuditAction.OTP_FAILED, null, exception.getMessage(), httpRequest);
			throw exception;
		}
	}

	public AuthResponse verifyOtp(OtpRequest request, HttpServletRequest httpRequest) {
		User existingUser = userRepository.findByPhone(request.getPhone()).orElse(null);
		OtpCode otpCode = otpCodeRepository.findTopByPhoneAndUsedFalseOrderByCreatedAtDesc(request.getPhone())
				.filter(code -> otpService.isValid(code, request.getOtp()))
				.orElseThrow(() -> {
					auditService.logFailure(AuditAction.OTP_FAILED, existingUser != null ? existingUser.getId() : null, messageResolver.resolve(ErrorKeys.Auth.INVALID_OTP), httpRequest);
					return new ApiException(ErrorKeys.Auth.INVALID_OTP);
				});

		otpCode.setUsed(true);
		otpCodeRepository.save(otpCode);

		User user = userRepository.findByPhone(request.getPhone())
				.orElseGet(() -> userRepository.save(createUser(request.getPhone())));

		String accessToken = tokenService.generateAccessToken(user);
		String refreshToken = tokenService.generateRefreshToken(user, httpRequest);
		auditService.logSuccess(AuditAction.LOGIN_SUCCESS, user.getId());
		return AuthResponse.builder()
				.accessToken(accessToken)
				.refreshToken(refreshToken)
				.user(UserDTO.from(user))
				.accessTokenExpiresIn(tokenService.accessTokenExpiresIn())
				.refreshTokenExpiresIn(tokenService.refreshTokenExpiresIn())
				.message(messageResolver.resolve(MessageKeys.Auth.OTP_VERIFIED))
				.build();
	}

	public AuthResponse refreshToken(RefreshRequest request, HttpServletRequest httpRequest) {
		return tokenService.rotateRefreshToken(request.getRefreshToken(), httpRequest);
	}

	public void logout(String rawAccessToken, String rawRefreshToken, UUID userId, HttpServletRequest request) {
		tokenService.blacklistAccessToken(rawAccessToken, BlacklistReason.LOGOUT);
		tokenService.revokeRefreshToken(rawRefreshToken, userId, BlacklistReason.LOGOUT);
		auditService.logSuccess(AuditAction.LOGOUT, userId);
	}

	private User createUser(String phone) {
		User user = new User();
		user.setPhone(phone);
		user.setFullName(phone);
		user.setRole(Role.ACHETEUR);
		user.setKycVerified(false);
		return user;
	}

}
