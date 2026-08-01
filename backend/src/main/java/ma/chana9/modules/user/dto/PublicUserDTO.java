package ma.chana9.modules.user.dto;

import ma.chana9.shared.enums.Role;

import java.util.UUID;

public record PublicUserDTO(
        UUID id,
        String fullName,
        Role role,
        boolean kycVerified,
        String profilePhotoUrl,
        String region
) {}