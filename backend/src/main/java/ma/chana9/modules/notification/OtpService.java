package ma.chana9.modules.notification;

import lombok.RequiredArgsConstructor;
import ma.chana9.config.OtpConfig;
import ma.chana9.modules.user.OtpCode;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class OtpService {

    private final WhatsAppService whatsAppService;
    private final OtpConfig otpConfig;

    public OtpCode createOtp(String phone) {
        String code = generateCode();
        LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(otpConfig.getExpirationMinutes());

        whatsAppService.sendOtp(phone, code);

        return OtpCode.builder()
                .phone(phone)
                .code(code)
                .expiresAt(expiresAt)
                .used(false)
                .build();
    }

    public boolean isValid(OtpCode otpCode, String submittedCode) {
        return otpCode.getCode().equals(submittedCode)
                && otpCode.getExpiresAt().isAfter(LocalDateTime.now())
                && !otpCode.getUsed();
    }

    private String generateCode() {
        return String.format("%06d", new Random().nextInt(999999));
    }
}