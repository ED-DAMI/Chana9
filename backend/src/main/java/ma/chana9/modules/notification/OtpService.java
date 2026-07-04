package ma.chana9.modules.notification;

import java.security.SecureRandom;
import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import ma.chana9.config.OtpConfig;
import ma.chana9.modules.user.OtpCode;

@Service
@RequiredArgsConstructor
public class OtpService {

    private static final SecureRandom RANDOM = new SecureRandom();

    private final OtpConfig otpConfig;

    public OtpCode createOtp(String phone) {
        OtpCode otpCode = new OtpCode();
        otpCode.setPhone(phone);
        otpCode.setCode(generateCode());
        otpCode.setUsed(false);
        otpCode.setExpiresAt(LocalDateTime.now().plusMinutes(otpConfig.getExpirationMinutes()));
        return otpCode;
    }

    public boolean isValid(OtpCode otpCode, String code) {
        return !otpCode.isUsed() && otpCode.getExpiresAt().isAfter(LocalDateTime.now()) && otpCode.getCode().equals(code);
    }

    private String generateCode() {
        return "%06d".formatted(RANDOM.nextInt(1_000_000));
    }
}