package ma.chana9.modules.annonce.dto;

import ma.chana9.shared.enums.ReportReason;
import ma.chana9.shared.enums.ReportStatus;

import java.time.LocalDateTime;
import java.util.UUID;

public record AnnonceReportResponse(
        UUID id,
        UUID annonceId,
        UUID reporterId,
        ReportReason reason,
        String comment,
        ReportStatus status,
        LocalDateTime createdAt
) {}