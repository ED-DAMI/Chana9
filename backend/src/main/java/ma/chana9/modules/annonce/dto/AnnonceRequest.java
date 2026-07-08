package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.*;
import lombok.*;
import ma.chana9.shared.enums.AnimalGender;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceRequest {

    @NotBlank
    @Size(max = 200)
    private String title;

    private String description;

    @NotBlank
    @Size(max = 100)
    private String breed;

    @DecimalMin("0.0")
    private BigDecimal estimatedWeight;

    @NotNull
    @DecimalMin("0.01")
    private BigDecimal price;

    private Boolean priceNegotiable;

    @NotBlank
    @Size(max = 100)
    private String region;

    private AnimalGender gender;

    private LocalDate birthDate;

    @Min(0)
    private Integer ageMonths;

    private Double latitude;
    private Double longitude;

    @Size(max = 255)
    private String addressLabel;

    private Boolean deliveryAvailable;

    @Min(0)
    private Integer deliveryRadiusKm;

    @DecimalMin("0.0")
    private BigDecimal deliveryPrice;
}
