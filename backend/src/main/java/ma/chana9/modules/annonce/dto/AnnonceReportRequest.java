package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.NotNull;
import ma.chana9.shared.enums.ReportReason;

public record AnnonceReportRequest(
        @NotNull
        ReportReason reason,
        String comment
) {}
