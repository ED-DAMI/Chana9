package ma.chana9.modules.notification;

import java.time.LocalDateTime;

import ma.chana9.modules.user.OtpCodeRepository;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import ma.chana9.config.OtpConfig;
import ma.chana9.modules.user.OtpCode;

@Service
@RequiredArgsConstructor
public class OtpService {

    private final OtpCodeRepository otpCodeRepository;
    private final WhatsAppService whatsAppService;
    private final OtpConfig otpConfig;

    public void sendOtp(String phone) {
        otpCodeRepository.deleteByPhone(phone);

        String code = generateCode();
        LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(otpConfig.getTtlMinutes());

        OtpCode otpCode = OtpCode.builder()
                .phone(phone)
                .code(code)
                .expiresAt(expiresAt)
                .build();

        otpCodeRepository.save(otpCode);
        whatsAppService.sendOtp(phone, code);
    }

    public boolean verifyOtp(String phone, String code) {
        return otpCodeRepository.findByPhoneAndCode(phone, code)
                .filter(otp -> otp.getExpiresAt().isAfter(LocalDateTime.now()))
                .map(otp -> {
                    otpCodeRepository.delete(otp);
                    return true;
                })
                .orElse(false);
    }

    private String generateCode() {
        return String.format("%06d", new java.util.Random().nextInt(999999));
    }
}