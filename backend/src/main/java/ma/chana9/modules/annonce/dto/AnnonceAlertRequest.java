package ma.chana9.modules.annonce.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceAlertRequest {

    private String breed;
    private String region;

    @Min(1)
    private Integer radiusKm;

    @DecimalMin("0.0")
    private BigDecimal maxPrice;

    @Min(0)
    private Integer minAgeMonths;
}
