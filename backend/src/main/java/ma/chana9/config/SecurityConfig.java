package ma.chana9.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.security.JwtAuthFilter;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@lombok.RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthFilter jwtAuthFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
                .cors(Customizer.withDefaults())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                    .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.SEND_OTP)
                        .permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.VERIFY_OTP)
                        .permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.REFRESH)
                        .permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Annonces.BASE)
                        .permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Annonces.BASE + "/*")
                        .permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Avis.USER + "/**")
                        .permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Users.STATS)
                        .permitAll()
                        .requestMatchers(ApiPaths.Audit.BASE + "/**")
                        .hasRole(Role.ADMIN.name())
                        .requestMatchers(HttpMethod.PUT, ApiPaths.Users.BASE + "/admin/**")
                        .hasRole(Role.ADMIN.name())
                        .requestMatchers(HttpMethod.POST, ApiPaths.Sequestres.BASE + "/admin/**")
                        .hasRole(Role.ADMIN.name())
                        .anyRequest()
                        .authenticated())
                .addFilterBefore(jwtAuthFilter, org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
