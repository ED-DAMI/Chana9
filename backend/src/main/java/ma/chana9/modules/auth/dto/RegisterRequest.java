package ma.chana9.modules.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record RegisterRequest(
        @NotBlank
        @Pattern(regexp = "^\\+?[0-9]{9,15}$", message = "Invalid phone number")
        String phone,

        @NotBlank
        @Size(min = 8, message = "Password must be at least 8 characters")
        String password,

        String fullName
) {}