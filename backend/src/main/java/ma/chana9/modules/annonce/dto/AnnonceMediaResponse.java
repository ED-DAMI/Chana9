package ma.chana9.modules.annonce.dto;

import java.util.UUID;

public record AnnonceMediaResponse(
        UUID id,
        String url,
        Integer displayOrder,
        Boolean isCover
) {}
