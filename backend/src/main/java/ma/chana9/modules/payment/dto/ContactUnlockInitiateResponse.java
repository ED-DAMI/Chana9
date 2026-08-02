package ma.chana9.modules.payment.dto;

import java.math.BigDecimal;
import java.util.UUID;

public record ContactUnlockInitiateResponse(
        UUID unlockId,
        String paymentUrl,
        BigDecimal amount,
        String currency
) {}