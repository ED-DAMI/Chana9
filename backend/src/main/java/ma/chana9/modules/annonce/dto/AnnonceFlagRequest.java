package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.NotNull;
import ma.chana9.shared.enums.FlagReason;

public record AnnonceFlagRequest(
        @NotNull FlagReason reason,
        String comment
) {}