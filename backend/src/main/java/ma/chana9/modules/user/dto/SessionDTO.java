package ma.chana9.modules.user.dto;

import java.time.LocalDateTime;
import java.util.UUID;

public record SessionDTO(
        UUID id,
        String deviceFingerprint,
        String userAgent,
        String ipAddress,
        LocalDateTime createdAt,
        LocalDateTime lastUsedAt
) {}