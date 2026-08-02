package ma.chana9.modules.user.dto;

import java.time.LocalDateTime;
import java.util.UUID;
import ma.chana9.shared.enums.Role;

public record UserDTO(
        UUID id,
        String phone,
        String fullName,
        Role role,
        boolean kycVerified,
        String profilePhotoUrl,
        String region,
        boolean active,
        LocalDateTime createdAt
) {}
