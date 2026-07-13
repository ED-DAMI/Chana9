package ma.chana9.modules.annonce.dto;

import ma.chana9.shared.enums.MediaFormat;

import java.util.UUID;

public record AnnonceMediaResponse(
        UUID id,
        String url,
        Integer order,
        Boolean isCover,
        MediaFormat format
) {}