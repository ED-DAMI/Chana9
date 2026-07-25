package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnimalDentition;

import java.math.BigDecimal;

public record AnnonceAlertRequest(

        AnimalBreed breed,
        String region,

        @DecimalMin("0.0")
        BigDecimal minPrice,

        @DecimalMin("0.0")
        BigDecimal maxPrice,

        AnimalDentition dentition
) {}
