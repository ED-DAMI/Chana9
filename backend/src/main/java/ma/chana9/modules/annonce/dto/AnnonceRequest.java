package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.*;
import ma.chana9.shared.enums.*;

import java.math.BigDecimal;

public record AnnonceRequest(

        @NotBlank @Size(max = 200)
        String title,

        String description,

        @NotNull
        AnimalBreed breed,

        AnimalGender gender,

        @Min(0)
        Integer ageMonths,

        @DecimalMin("0.0")
        BigDecimal weightKg,

        AnimalDentition dentition,

        @Size(max = 50)
        String onssaTagNumber,

        @NotNull @DecimalMin("0.01")
        BigDecimal price,

        PriceType priceType,

        Boolean priceNegotiable,

        @Min(1)
        Integer headCount,

        @NotBlank @Size(max = 100)
        String region,

        @Size(max = 255)
        String addressLabel,

        Double latitude,
        Double longitude,

        Boolean deliveryAvailable,

        @DecimalMin("0.0")
        BigDecimal deliveryPrice,

        Boolean boardingAvailable,

        @DecimalMin("0.0")
        BigDecimal boardingDailyPrice
) {}
