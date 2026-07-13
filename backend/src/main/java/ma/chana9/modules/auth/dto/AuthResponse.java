package ma.chana9.modules.auth.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import ma.chana9.modules.user.dto.UserDTO;

@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public record AuthResponse(
        String accessToken,
        String refreshToken,
        Long accessTokenExpiresIn,
        Long refreshTokenExpiresIn,
        UserDTO user,
        String message
) {
    public static AuthResponse message(String message) {
        return new AuthResponse(null, null, null, null, null, message);
    }

}