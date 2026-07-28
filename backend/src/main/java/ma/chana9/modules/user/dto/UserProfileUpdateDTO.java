package ma.chana9.modules.user.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UserProfileUpdateDTO(
        @NotBlank
        @Size(min = 3, max = 100)
        String fullName,

        @Size(max = 100)
        String region
) {}