package ma.chana9.modules.user;

import java.util.UUID;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.user.dto.PasswordUpdateDTO;
import ma.chana9.modules.user.dto.RoleUpdateDTO;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.modules.user.dto.UserProfileUpdateDTO;
import ma.chana9.modules.user.dto.UserStatsDTO;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.security.AppUserDetails;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Users.BASE)
public class UserController {
	private final UserService userService;
	private final MessageResolver messageResolver;
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/me")
	public ApiResponse<UserDTO> getCurrentProfile(@AuthenticationPrincipal AppUserDetails auth) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.getProfile(auth.getId())
		);
	}
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/me")
	public ApiResponse<UserDTO> updateProfile(
			@AuthenticationPrincipal AppUserDetails auth,
			@Valid @RequestBody UserProfileUpdateDTO dto) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.updateProfile(auth.getId(), dto)
		);
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/{id}")
	public ApiResponse<UserDTO> getPublicProfile(@PathVariable UUID id) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.getPublicProfile(id)
		);
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/me/kyc")
	public ApiResponse<Void> submitKyc(
			 @AuthenticationPrincipal UUID userId,
			@RequestParam("cin") String cin,
			@RequestParam("cinPhoto") MultipartFile cinPhoto,
			@RequestParam("selfie") MultipartFile selfie) {
		userService.submitKyc(userId, cin, cinPhoto, selfie);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/me/kyc")
	public ApiResponse<String> getKycStatus(@AuthenticationPrincipal UUID userId) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.getKycStatus(userId)
		);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/{id}/kyc/approve")
	public ApiResponse<Void> approveKyc(@PathVariable UUID id) {
		userService.approveKyc(id);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/{id}/kyc/reject")
	public ApiResponse<Void> rejectKyc(@PathVariable UUID id) {
		userService.rejectKyc(id);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@PostMapping("/me/avatar")
	public ApiResponse<String> uploadAvatar(
			@AuthenticationPrincipal AppUserDetails auth,
			@RequestParam("file") MultipartFile file) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.uploadAvatar(auth.getId(), file)
		);
	}

	@DeleteMapping("/me/avatar")
	public ApiResponse<Void> deleteAvatar(@AuthenticationPrincipal AppUserDetails auth) {
		userService.deleteAvatar(auth.getId());
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping
	public ApiResponse<Page<UserDTO>> getAllUsers(Pageable pageable) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.findAllUsers(pageable)
		);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/{id}/activate")
	public ApiResponse<Void> activateUser(@PathVariable UUID id) {
		userService.activateUser(id);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/{id}/deactivate")
	public ApiResponse<Void> deactivateUser(@PathVariable UUID id) {
		userService.deactivateUser(id);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("/{id}/role")
	public ApiResponse<Void> changeRole(
			@PathVariable UUID id,
			@Valid @RequestBody RoleUpdateDTO dto) {
		userService.changeUserRole(id, dto);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@GetMapping("/{id}/stats")
	public ApiResponse<UserStatsDTO> getUserStats(@PathVariable UUID id) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.getUserStats(id)
		);
	}

	@PutMapping("/me/password")
	public ApiResponse<Void> changePassword(
			@AuthenticationPrincipal UUID userId,
			@Valid @RequestBody PasswordUpdateDTO dto) {
		userService.changePassword(userId, dto);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}

	@GetMapping("/me/sessions")
	public ApiResponse<Object> getActiveSessions(@AuthenticationPrincipal AppUserDetails auth) {
		return ApiResponse.success(
				messageResolver.resolve(MessageKeys.DEFAULT),
				userService.getActiveSessions(auth.getId())
		);
	}

	@DeleteMapping("/me/sessions")
	public ApiResponse<Void> revokeAllSessions(@AuthenticationPrincipal UUID userId) {
		userService.revokeAllSessions(userId);
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
	}
}