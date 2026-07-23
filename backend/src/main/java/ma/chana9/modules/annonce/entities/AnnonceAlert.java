package ma.chana9.modules.annonce.entities;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.shared.enums.AnimalBreed;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "annonce_alerts")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceAlert {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "buyer_id", nullable = false)
    private UUID buyerId;

    @Enumerated(EnumType.STRING)
    @Column(name = "breed", length = 100)
    private AnimalBreed breed;

    @Column(name = "region", length = 100)
    private String region;

    @Column(name = "radius_km")
    private Integer radiusKm;

    @Column(name = "max_price", precision = 10, scale = 2)
    private BigDecimal maxPrice;

    @Column(name = "min_age_months")
    private Integer minAgeMonths;

    @Column(name = "is_active", nullable = false)
    @Builder.Default
    private Boolean active = true;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    void onCreate() {
        createdAt = LocalDateTime.now();
        if (active == null) active = true;
    }

    public boolean matches(Annonce annonce) {
        if (breed != null && !breed.equals(annonce.getBreed())) return false;
        if (region != null && !region.equalsIgnoreCase(annonce.getRegion())) return false;
        if (maxPrice != null && annonce.getPrice().compareTo(maxPrice) > 0) return false;
        if (minAgeMonths != null) {
            Integer age = annonce.getEffectiveAgeMonths();
            if (age == null || age < minAgeMonths) return false;
        }
        return true;
    }
}