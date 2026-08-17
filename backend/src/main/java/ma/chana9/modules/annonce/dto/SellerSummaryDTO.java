package ma.chana9.modules.annonce.dto;

import java.util.UUID;

public record SellerSummaryDTO(
        UUID id,
        String fullName,
        String avatarUrl,
        String region
) {}