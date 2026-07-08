package ma.chana9.modules.user.dto;

import java.util.UUID;

import lombok.Builder;
import lombok.Data;
import ma.chana9.modules.user.User;

@Data
@Builder
public class UserDTO {
    private UUID id;
    private String phone;
    private String fullName;
    private String role;
    private boolean kycVerified;
    public static UserDTO from(User user) {
        return UserDTO.builder()
                .id(user.getId())
                .phone(user.getPhone())
                .fullName(user.getFullName())
                .role(user.getRole() != null ? user.getRole().name() : null)
                .kycVerified(user.isKycVerified())
                .build();
    }
}