package ma.chana9.modules.notification;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import ma.chana9.config.WhatsAppProperties;
import ma.chana9.shared.exception.ApiException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class WhatsAppService {

    private final WhatsAppProperties properties;
    private final ObjectMapper objectMapper;
    private final HttpClient httpClient = HttpClient.newHttpClient();

    public void sendOtp(String phoneNumber, String otpCode) {
        try {
            String url = "https://graph.facebook.com/%s/%s/messages"
                    .formatted(properties.getApiVersion(), properties.getPhoneNumberId());

            Map<String, Object> body = Map.of(
                    "messaging_product", "whatsapp",
                    "to", normalizePhone(phoneNumber),
                    "type", "template",
                    "template", Map.of(
                            "name", properties.getTemplateName(),
                            "language", Map.of("code", properties.getTemplateLanguage()),
                            "components", List.of(
                                    Map.of(
                                            "type", "body",
                                            "parameters", List.of(
                                                    Map.of("type", "text", "text", otpCode)
                                            )
                                    ),
                                    Map.of(
                                            "type", "button",
                                            "sub_type", "url",
                                            "index", "0",
                                            "parameters", List.of(
                                                    Map.of("type", "text", "text", otpCode)
                                            )
                                    )
                            )
                    )
            );

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("Authorization", "Bearer " + properties.getAccessToken())
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(objectMapper.writeValueAsString(body)))
                    .build();

            HttpResponse<String> response = httpClient.send(
                    request, HttpResponse.BodyHandlers.ofString()
            );

            if (response.statusCode() >= 400) {
                System.err.println("Erreur API Meta (" + response.statusCode() + ") : " + response.body());
                throw new ApiException(HttpStatus.SERVICE_UNAVAILABLE, "error.whatsapp.send_failed");
            }

        } catch (ApiException e) {
            throw e;
        } catch (Exception e) {
            throw new ApiException(HttpStatus.SERVICE_UNAVAILABLE, "error.whatsapp.send_failed");
        }
    }

    private String normalizePhone(String phone) {
        String digits = phone.replaceAll("[^0-9]", "");
        if (digits.startsWith("0")) {
            return "212" + digits.substring(1);
        }
        return digits;
    }
}