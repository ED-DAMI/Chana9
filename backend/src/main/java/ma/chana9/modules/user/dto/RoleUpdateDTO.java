package ma.chana9.modules.user.dto;

import jakarta.validation.constraints.NotNull;
import ma.chana9.shared.enums.Role;

public record RoleUpdateDTO(
        @NotNull
        Role role
) {}