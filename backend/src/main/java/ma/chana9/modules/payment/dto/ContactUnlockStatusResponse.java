package ma.chana9.modules.payment.dto;

import ma.chana9.shared.enums.ContactUnlockStatus;

import java.time.LocalDateTime;
import java.util.UUID;

public record ContactUnlockStatusResponse(
        UUID unlockId,
        ContactUnlockStatus status,
        String phone,
        LocalDateTime completedAt
) {}
 