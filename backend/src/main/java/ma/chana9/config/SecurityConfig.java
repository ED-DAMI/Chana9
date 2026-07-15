package ma.chana9.config;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.auth.LogFilter;
import ma.chana9.modules.user.CustomUserDetailsService;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.enums.Role;
import ma.chana9.shared.security.JwtAuthFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final JwtAuthFilter jwtAuthFilter;
    private final CustomUserDetailsService customUserDetailsService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, LogFilter logFilter) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .cors(Customizer.withDefaults())
                .sessionManagement(session -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.REGISTER).permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.LOGIN).permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.FORGOT_PASSWORD).permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.RESET_PASSWORD).permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Auth.BASE + ApiPaths.Auth.REFRESH).permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Annonces.BASE).permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Annonces.BASE + "/*").permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Avis.USER + "/**").permitAll()
                        .requestMatchers(HttpMethod.GET, ApiPaths.Users.STATS).permitAll()
                        .requestMatchers(ApiPaths.Audit.BASE + "/**").hasRole(Role.ADMIN.name())
                        .requestMatchers(HttpMethod.PUT, ApiPaths.Users.BASE + "/admin/**").hasRole(Role.ADMIN.name())
                        .requestMatchers(HttpMethod.GET, ApiPaths.Storage.BASE + "/**").permitAll()
                        .requestMatchers(HttpMethod.POST, ApiPaths.Sequestres.BASE + "/admin/**").hasRole(Role.ADMIN.name())
                        .anyRequest().authenticated()
                )
                .authenticationProvider(authenticationProvider())
                //.addFilterBefore(logFilter,UsernamePasswordAuthenticationFilter.class)
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(customUserDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }
}