package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import lombok.*;
import ma.chana9.shared.enums.AnimalGender;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceSearchRequest {

    private String breed;
    private String region;

    @DecimalMin("0.0")
    private BigDecimal minPrice;

    @DecimalMin("0.0")
    private BigDecimal maxPrice;

    @DecimalMin("0.0")
    private BigDecimal minWeight;

    @DecimalMin("0.0")
    private BigDecimal maxWeight;

    private AnimalGender gender;

    @Min(0)
    private Integer minAgeMonths;

    @Min(0)
    private Integer maxAgeMonths;

    private Boolean deliveryAvailable;
    private Boolean priceNegotiable;
    private Boolean eligibleForAid;
    private Boolean topLotOnly;

    private Double latitude;
    private Double longitude;

    @Min(1)
    private Integer radiusKm;
}