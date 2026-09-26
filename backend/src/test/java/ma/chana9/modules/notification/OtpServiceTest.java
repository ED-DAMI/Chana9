package ma.chana9.modules.notification;

import ma.chana9.config.OtpConfig;
import ma.chana9.modules.user.OtpCode;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class OtpServiceTest {

    @Mock
    private WhatsAppService whatsAppService;

    private OtpService otpService;

    @BeforeEach
    void setUp() {
        OtpConfig otpConfig = new OtpConfig();
        otpConfig.setExpirationMinutes(5);
        otpService = new OtpService(whatsAppService, otpConfig);
    }

    @Test
    void createOtp_shouldCreateSixDigitCodeAndSendIt() {
    }

    @Test
    void isValid_whenCodeIsCurrentAndUnused_shouldReturnTrue() {
        OtpCode otpCode = OtpCode.builder()
                .code("123456")
                .expiresAt(LocalDateTime.now().plusMinutes(1))
                .used(false)
                .build();

        assertTrue(otpService.isValid(otpCode, "123456"));
    }

    @Test
    void isValid_whenCodeIsExpired_shouldReturnFalse() {
        OtpCode otpCode = OtpCode.builder()
                .code("123456")
                .expiresAt(LocalDateTime.now().minusSeconds(1))
                .used(false)
                .build();

        assertFalse(otpService.isValid(otpCode, "123456"));
    }

    @Test
    void isValid_whenCodeWasUsedOrDoesNotMatch_shouldReturnFalse() {
        OtpCode usedOtp = OtpCode.builder()
                .code("123456")
                .expiresAt(LocalDateTime.now().plusMinutes(1))
                .used(true)
                .build();

        assertFalse(otpService.isValid(usedOtp, "123456"));
        assertFalse(otpService.isValid(usedOtp, "654321"));
    }
}