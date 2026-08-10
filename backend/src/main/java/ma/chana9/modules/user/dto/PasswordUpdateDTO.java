package ma.chana9.modules.user.dto;

import jakarta.validation.constraints.NotBlank;

public record PasswordUpdateDTO(
        @NotBlank
        String currentPassword,
        @NotBlank
        String newPassword
) {}