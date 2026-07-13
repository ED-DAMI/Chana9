package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import ma.chana9.shared.enums.AnimalGender;

import java.math.BigDecimal;

public record AnnonceSearchRequest(
        String breed,
        String region,

        @DecimalMin("0.0") BigDecimal minPrice,
        @DecimalMin("0.0") BigDecimal maxPrice,
        @DecimalMin("0.0") BigDecimal minWeight,
        @DecimalMin("0.0") BigDecimal maxWeight,

        AnimalGender gender,

        @Min(0) Integer minAgeMonths,
        @Min(0) Integer maxAgeMonths,

        Boolean deliveryAvailable,
        Boolean priceNegotiable,
        Boolean eligibleForAid,
        Boolean topLotOnly,

        Double latitude,
        Double longitude,

        @Min(1) Integer radiusKm
) {}