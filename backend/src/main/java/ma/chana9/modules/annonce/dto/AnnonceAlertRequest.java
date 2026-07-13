package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;

import java.math.BigDecimal;

public record AnnonceAlertRequest(
        String breed,
        String region,

        @Min(1) Integer radiusKm,
        @DecimalMin("0.0") BigDecimal maxPrice,
        @Min(0) Integer minAgeMonths
) {}