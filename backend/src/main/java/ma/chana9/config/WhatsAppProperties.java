package ma.chana9.config;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "whatsapp")
public class WhatsAppProperties {
    private String phoneNumberId;
    private String accessToken;
    private String apiVersion;
    private String templateName;
    private String templateLanguage;
}