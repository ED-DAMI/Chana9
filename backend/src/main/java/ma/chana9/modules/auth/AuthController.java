package ma.chana9.modules.auth;

import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.dto.AuthResponse;
import ma.chana9.modules.auth.dto.LoginRequest;
import ma.chana9.modules.auth.dto.LogoutRequest;
import ma.chana9.modules.auth.dto.PasswordLoginRequest;
import ma.chana9.modules.auth.dto.PasswordResetRequest;
import ma.chana9.modules.auth.dto.RefreshRequest;
import ma.chana9.modules.auth.dto.RegisterRequest;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.constants.SecurityConstants;
import ma.chana9.shared.enums.BlacklistReason;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.security.exception.InvalidTokenException;
import ma.chana9.shared.security.service.TokenService;
import org.springframework.http.HttpHeaders;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Auth.BASE)
public class AuthController {

	private final AuthService authService;
	private final TokenService tokenService;
	private final MessageResolver messageResolver;

	@PostMapping(ApiPaths.Auth.REGISTER)
	public AuthResponse register(
			@Valid @RequestBody RegisterRequest request,
			HttpServletRequest httpRequest) {
		return authService.register(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.LOGIN)
	public AuthResponse login(
			@Valid @RequestBody PasswordLoginRequest request,
			HttpServletRequest httpRequest) {
		return authService.login(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.FORGOT_PASSWORD)
	public AuthResponse forgotPassword(
			@Valid @RequestBody LoginRequest request,
			HttpServletRequest httpRequest) {
		return authService.sendResetOtp(request, httpRequest);
	}

//	@PostMapping(ApiPaths.Auth.RESET_PASSWORD)
//	public AuthResponse resetPassword(
//			@Valid @RequestBody PasswordResetRequest request,
//			HttpServletRequest httpRequest) {
//		return authService.resetPassword(request, httpRequest);
//	}

	@PostMapping(ApiPaths.Auth.LOGOUT)
	@PreAuthorize("isAuthenticated()")
	public ApiResponse<Void> logout(
			@Valid @RequestBody LogoutRequest request,
			@AuthenticationPrincipal UUID userId,
			@RequestHeader(HttpHeaders.AUTHORIZATION) String authorization,
			HttpServletRequest httpRequest) {
		authService.logout(extractBearer(authorization), request.getRefreshToken(), userId, httpRequest);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.Auth.LOGOUT_SUCCESS), null);
	}

	@PostMapping(ApiPaths.Auth.REFRESH)
	public AuthResponse refresh(
			@Valid @RequestBody RefreshRequest request,
			HttpServletRequest httpRequest) {
		return authService.refreshToken(request, httpRequest);
	}

	@PostMapping(ApiPaths.Auth.REVOKE_ALL)
	@PreAuthorize("isAuthenticated()")
	public ApiResponse<Void> revokeAll(@AuthenticationPrincipal UUID userId) {
		tokenService.revokeAllUserTokens(userId, BlacklistReason.TOKEN_ROTATION);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.Auth.TOKENS_REVOKED), null);
	}

	private String extractBearer(String authorization) {
		if (authorization == null || !authorization.startsWith(SecurityConstants.BEARER_PREFIX)) {
			throw new InvalidTokenException();
		}
		return authorization.substring(SecurityConstants.BEARER_PREFIX.length());
	}
}