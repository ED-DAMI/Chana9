package ma.chana9.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "app.security")
public class SecurityProperties {

    private int maxRefreshTokensPerUser;
    private String cleanupCron;
    private String refreshCleanupCron;
}