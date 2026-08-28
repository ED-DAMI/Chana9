package ma.chana9.modules.notification;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

@Slf4j
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
                            "name", "hello_world",
                            "language", Map.of("code", "en_US")
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
                log.error("Échec de l'envoi WhatsApp API [Status: {}] | Réponse Meta: {}",
                        response.statusCode(), response.body());
                throw new ApiException(HttpStatus.SERVICE_UNAVAILABLE, "error.whatsapp.send_failed: " + response.body());
            }

            log.info("Message WhatsApp envoyé avec succès au numéro {}", normalizePhone(phoneNumber));

        } catch (ApiException e) {
            throw e;
        } catch (Exception e) {
            log.error("Erreur inattendue lors de l'appel à l'API WhatsApp", e);
            throw new ApiException(HttpStatus.SERVICE_UNAVAILABLE, "error.whatsapp.send_failed: " + e.getMessage());
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