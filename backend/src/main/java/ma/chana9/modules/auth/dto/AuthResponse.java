package ma.chana9.modules.auth.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import ma.chana9.modules.user.dto.UserDTO;

@Getter
@Setter
@Data
@Builder
public class AuthResponse {

    private final String message;
    private final String accessToken;
    private final String refreshToken;
    private final UserDTO user;
    private final long accessTokenExpiresIn;
    private final long refreshTokenExpiresIn;

    public static AuthResponse message(String message) {
        return AuthResponse.builder().message(message).build();
    }

    public static AuthResponse of(String accessToken, String refreshToken, UserDTO user, long accessTokenExpiresIn, long refreshTokenExpiresIn) {
        return AuthResponse.builder()
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .user(user)
                .accessTokenExpiresIn(accessTokenExpiresIn)
                .refreshTokenExpiresIn(refreshTokenExpiresIn)
                .build();
    }
}