package ma.chana9.modules.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class LogFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String method = request.getMethod();
        String requestURI = request.getRequestURI();
        String ip = request.getRemoteAddr();
        System.out.println("<================++++++++++++================log========++++++++++++++++++++++=======>");
        System.out.println("log :"+ip+" ;"+method+" ;"+requestURI);

        filterChain.doFilter(request,response);
    }
}
