package ma.chana9.modules.auth;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.OtpRequest;
import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.user.OtpCode;
import ma.chana9.modules.user.OtpCodeRepository;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.exception.ApiException;
import ma.chana9.shared.i18n.MessageResolver;

@Service
@RequiredArgsConstructor
public class AuthService {

	private final UserRepository userRepository;
	private final OtpCodeRepository otpCodeRepository;
	private final JwtService jwtService;
	private final OtpService otpService;
	private final MessageResolver messageResolver;

	public AuthResponse sendOtp(LoginRequest request) {
		OtpCode otpCode = otpService.createOtp(request.getPhone());
		otpCodeRepository.save(otpCode);
		return AuthResponse.message(messageResolver.resolve(MessageKeys.Auth.OTP_SENT));
	}

	public AuthResponse verifyOtp(OtpRequest request) {
		OtpCode otpCode = otpCodeRepository.findTopByPhoneAndUsedFalseOrderByCreatedAtDesc(request.getPhone())
				.filter(code -> otpService.isValid(code, request.getOtp()))
				.orElseThrow(() -> new ApiException(ErrorKeys.Auth.INVALID_OTP));

		otpCode.setUsed(true);
		otpCodeRepository.save(otpCode);

		User user = userRepository.findByPhone(request.getPhone())
				.orElseGet(() -> userRepository.save(createUser(request.getPhone())));

		return AuthResponse.of(jwtService.generateToken(user), user, messageResolver.resolve(MessageKeys.Auth.OTP_VERIFIED));
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
