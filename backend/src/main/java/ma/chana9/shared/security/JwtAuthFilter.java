package ma.chana9.shared.security;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.http.HttpHeaders;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.constants.SecurityConstants;
import ma.chana9.shared.response.ApiResponse;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.security.service.TokenService;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;

@Component
@RequiredArgsConstructor
public class JwtAuthFilter extends OncePerRequestFilter {

    private final TokenService tokenService;
    private final MessageResolver messageResolver;
    private final ObjectMapper objectMapper;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String header = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (header == null || !header.startsWith(SecurityConstants.BEARER_PREFIX)) {
            filterChain.doFilter(request, response);
            return;
        }
        String token = header.substring(SecurityConstants.BEARER_PREFIX.length());
        try {
            tokenService.parseClaims(token);
            if (tokenService.isAccessTokenBlacklisted(token)) {
                writeError(response, 401, ErrorKeys.Auth.TOKEN_REVOKED);
                return;
            }
            UUID userId = tokenService.extractUserId(token);
            var role = tokenService.extractRole(token);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                    userId,
                    null,
                    List.of(new SimpleGrantedAuthority("ROLE_%s".formatted(role.name()))));
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            request.setAttribute(SecurityConstants.REQUEST_USER_ID_ATTRIBUTE, userId);
            filterChain.doFilter(request, response);
        } catch (ExpiredJwtException exception) {
            writeError(response, 401, ErrorKeys.Auth.TOKEN_EXPIRED);
        } catch (JwtException exception) {
            writeError(response, 401, ErrorKeys.Auth.INVALID_TOKEN);
        } catch (RuntimeException exception) {
            writeError(response, 401, ErrorKeys.Auth.INVALID_TOKEN);
        }

    }

    private void writeError(HttpServletResponse response, int status, String messageKey) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding(java.nio.charset.StandardCharsets.UTF_8.name());
        objectMapper.writeValue(response.getWriter(), ApiResponse.error(messageResolver.resolve(messageKey)));
    }
}