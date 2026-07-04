package ma.chana9.shared.security;

import java.util.UUID;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.user.User;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.security.service.TokenService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class JwtService {

    private final TokenService tokenService;

    public String generateToken(User user) {
        return tokenService.generateAccessToken(user);
    }

    public boolean isValid(String token) {
        return tokenService.isTokenValid(token);
    }

    public String extractSubject(String token) {
        return tokenService.extractUserId(token).toString();
    }

    public UUID extractUserId(String token) {
        return tokenService.extractUserId(token);
    }

    public Role extractRole(String token) {
        return tokenService.extractRole(token);
    }
}