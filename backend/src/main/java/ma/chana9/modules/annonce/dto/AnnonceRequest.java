
package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.*;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnimalGender;

import java.math.BigDecimal;

public record AnnonceRequest(

        @NotBlank @Size(max = 200)
        String title,

        String description,

        @NotNull
        AnimalBreed breed,

        @NotNull @DecimalMin("0.01")
        BigDecimal price,

        Boolean priceNegotiable,

        @NotBlank @Size(max = 100)
        String region,

        AnimalGender gender,

        @Min(0)
        Integer ageMonths,

        Double latitude,
        Double longitude,

        @Size(max = 255)
        String addressLabel,

        Boolean deliveryAvailable,

        @DecimalMin("0.0")
        BigDecimal deliveryPrice
) {}