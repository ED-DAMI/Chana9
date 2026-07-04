package ma.chana9.modules.auth;

import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.LogoutRequest;
import ma.chana9.modules.auth.dto.OtpRequest;
import ma.chana9.modules.auth.dto.RefreshRequest;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.security.service.TokenService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.http.HttpHeaders;
import ma.chana9.shared.security.exception.InvalidTokenException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Auth.BASE)
public class AuthController {

	private final AuthService authService;
	private final TokenService tokenService;
	private final MessageResolver messageResolver;

	@PostMapping(ApiPaths.Auth.SEND_OTP)
	public AuthResponse sendOtp(@Valid @RequestBody LoginRequest request, HttpServletRequest httpRequest) {
		return authService.sendOtp(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.VERIFY_OTP)
	public AuthResponse verifyOtp(@Valid @RequestBody OtpRequest request, HttpServletRequest httpRequest) {
		return authService.verifyOtp(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.LOGOUT)
	public ApiResponse<Void> logout(@Valid @RequestBody LogoutRequest request, @AuthenticationPrincipal UUID userId, @RequestHeader(HttpHeaders.AUTHORIZATION) String authorization, HttpServletRequest httpRequest) {
		authService.logout(extractBearer(authorization), request.getRefreshToken(), userId, httpRequest);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.Auth.LOGOUT_SUCCESS), null);
	}

	@PostMapping(ApiPaths.Auth.REFRESH)
	public AuthResponse refresh(@Valid @RequestBody RefreshRequest request, HttpServletRequest httpRequest) {
		return authService.refreshToken(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.REVOKE_ALL)
	@PreAuthorize("isAuthenticated()")
	public ApiResponse<Void> revokeAll(@AuthenticationPrincipal UUID userId) {
		tokenService.revokeAllUserTokens(userId, BlacklistReason.TOKEN_ROTATION);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.Auth.TOKENS_REVOKED), null);
	}

	private String extractBearer(String authorization) {
		if (authorization == null || !authorization.startsWith(ma.chana9.shared.constants.SecurityConstants.BEARER_PREFIX)) {
			throw new InvalidTokenException();
		}
		return authorization.substring(ma.chana9.shared.constants.SecurityConstants.BEARER_PREFIX.length());
	}
}
