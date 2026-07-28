package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnimalDentition;
import ma.chana9.shared.enums.AnimalGender;

import java.math.BigDecimal;

public record AnnonceSearchRequest(

        AnimalBreed breed,
        AnimalGender gender,
        AnimalDentition dentition,
        String region,

        @DecimalMin("0.0")
        BigDecimal minPrice,

        @DecimalMin("0.0")
        BigDecimal maxPrice,

        @DecimalMin("0.0")
        BigDecimal minWeightKg,

        @DecimalMin("0.0")
        BigDecimal maxWeightKg,

        @Min(0)
        Integer minAgeMonths,

        @Min(0)
        Integer maxAgeMonths,

        Boolean deliveryAvailable,
        Boolean boardingAvailable,
        Boolean priceNegotiable,
        Boolean topLotOnly,
        Boolean eligibleForAid,

        Double latitude,
        Double longitude,

        @Min(1)
        Integer radiusKm
) {}
