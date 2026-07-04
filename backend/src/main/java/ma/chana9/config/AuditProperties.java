package ma.chana9.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "app.audit")
public class AuditProperties {

    private boolean async;
    private int retainDays;
}