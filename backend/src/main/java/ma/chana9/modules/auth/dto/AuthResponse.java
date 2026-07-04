package ma.chana9.modules.auth.dto;

import lombok.Builder;
import lombok.Getter;
import ma.chana9.modules.user.User;

@Getter
@Builder
public class AuthResponse {

    private final String message;
    private final String accessToken;
    private final User user;

    public static AuthResponse message(String message) {
        return AuthResponse.builder().message(message).build();
    }

    public static AuthResponse of(String accessToken, User user, String message) {
        return AuthResponse.builder().accessToken(accessToken).user(user).message(message).build();
    }
}