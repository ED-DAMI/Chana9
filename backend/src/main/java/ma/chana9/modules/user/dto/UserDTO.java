package ma.chana9.modules.user.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.chana9.shared.enums.Role;

import java.time.LocalDateTime;
import java.util.UUID;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record UserDTO(
        UUID id,
        String phone,
        String fullName,
        Role role,
        boolean kycVerified,
        LocalDateTime kycSubmittedAt,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {}