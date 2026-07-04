package ma.chana9.modules.auth;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.OtpRequest;
import ma.chana9.shared.constants.ApiPaths;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Auth.BASE)
public class AuthController {

	private final AuthService authService;

	@PostMapping(ApiPaths.Auth.SEND_OTP)
	public AuthResponse sendOtp(@Valid @RequestBody LoginRequest request) {
		return authService.sendOtp(request);
	}

	@PostMapping(ApiPaths.Auth.VERIFY_OTP)
	public AuthResponse verifyOtp(@Valid @RequestBody OtpRequest request) {
		return authService.verifyOtp(request);
	}
}
