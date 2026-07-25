package ma.chana9.modules.annonce.dto;

import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnimalDentition;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

public record AnnonceAlertResponse(
        UUID id,
        UUID buyerId,
        AnimalBreed breed,
        String region,
        BigDecimal minPrice,
        BigDecimal maxPrice,
        AnimalDentition dentition,
        Boolean active,
        LocalDateTime createdAt
) {}
