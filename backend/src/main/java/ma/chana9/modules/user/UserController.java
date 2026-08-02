package ma.chana9.modules.user;

import java.util.List;
import java.util.UUID;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.modules.user.dto.*;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Users.BASE)
public class UserController {

    private final UserService     userService;
    private final MessageResolver messageResolver;

    @GetMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<UserDTO> getCurrentProfile(@AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, userService.getProfile(userId));
    }

    @PutMapping("/me")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<UserDTO> updateProfile(
            @AuthenticationPrincipal UUID userId,
            @Valid @RequestBody UserProfileUpdateDTO dto) {
        return ApiResponse.success(null, userService.updateProfile(userId, dto));
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<PublicUserDTO> getPublicProfile(@PathVariable UUID id) {
        return ApiResponse.success(null, userService.getPublicProfile(id));
    }

    @PostMapping("/me/kyc")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<Void> submitKyc(
            @AuthenticationPrincipal UUID userId,
            @RequestParam("cin") String cin,
            @RequestParam("cinPhoto") MultipartFile cinPhoto,
            @RequestParam("selfie") MultipartFile selfie) {
        userService.submitKyc(userId, cin, cinPhoto, selfie);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @GetMapping("/me/kyc")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<String> getKycStatus(@AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, userService.getKycStatus(userId));
    }

    @PutMapping("/{id}/kyc/approve")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Void> approveKyc(@PathVariable UUID id) {
        userService.approveKyc(id);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @PutMapping("/{id}/kyc/reject")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Void> rejectKyc(@PathVariable UUID id) {
        userService.rejectKyc(id);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @PostMapping("/me/avatar")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<String> uploadAvatar(
            @AuthenticationPrincipal UUID userId,
            @RequestParam("file") MultipartFile file) {
        return ApiResponse.success(null, userService.uploadAvatar(userId, file));
    }

    @DeleteMapping("/me/avatar")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAvatar(@AuthenticationPrincipal UUID userId) {
        userService.deleteAvatar(userId);
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Page<UserDTO>> getAllUsers(Pageable pageable) {
        return ApiResponse.success(null, userService.findAllUsers(pageable));
    }

    @PutMapping("/{id}/activate")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Void> activateUser(@PathVariable UUID id) {
        userService.activateUser(id);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @PutMapping("/{id}/deactivate")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Void> deactivateUser(@PathVariable UUID id) {
        userService.deactivateUser(id);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @PutMapping("/{id}/role")
    @PreAuthorize("hasRole('ADMIN')")
    public ApiResponse<Void> changeRole(
            @PathVariable UUID id,
            @Valid @RequestBody RoleUpdateDTO dto) {
        userService.changeUserRole(id, dto);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @GetMapping("/{id}/stats")
    public ApiResponse<UserStatsDTO> getUserStats(@PathVariable UUID id) {
        return ApiResponse.success(null, userService.getUserStats(id));
    }

    @PutMapping("/me/password")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<Void> changePassword(
            @AuthenticationPrincipal UUID userId,
            @Valid @RequestBody PasswordUpdateDTO dto) {
        userService.changePassword(userId, dto);
        return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), null);
    }

    @GetMapping("/me/sessions")
    @PreAuthorize("isAuthenticated()")
    public ApiResponse<List<SessionDTO>> getActiveSessions(@AuthenticationPrincipal UUID userId) {
        return ApiResponse.success(null, userService.getActiveSessions(userId));
    }

    @DeleteMapping("/me/sessions")
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void revokeAllSessions(@AuthenticationPrincipal UUID userId) {
        userService.revokeAllSessions(userId);
    }
}