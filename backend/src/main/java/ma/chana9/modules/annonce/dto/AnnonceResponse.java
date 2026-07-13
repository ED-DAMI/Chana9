package ma.chana9.modules.annonce.dto;

import lombok.*;
import ma.chana9.shared.enums.AnimalGender;
import ma.chana9.shared.enums.AnnonceStatus;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceResponse {
    private UUID id;
    private String title;
    private String description;
    private String breed;
    private BigDecimal estimatedWeight;
    private BigDecimal price;
    private Boolean priceNegotiable;
    private String region;
    private AnnonceStatus status;
    private AnimalGender gender;
    private LocalDate birthDate;
    private Integer ageMonths;
    private Integer effectiveAgeMonths;
    private Boolean eligibleForAid;
    private String addressLabel;
    private Double latitude;
    private Double longitude;
    private Double distanceKm;
    private Boolean deliveryAvailable;
    private Integer deliveryRadiusKm;
    private BigDecimal deliveryPrice;
    private Boolean isTopLot;
    private LocalDateTime topLotExpiresAt;
    private LocalDateTime expiresAt;
    private UUID sellerId;
    private List<AnnonceMediaResponse> medias;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}