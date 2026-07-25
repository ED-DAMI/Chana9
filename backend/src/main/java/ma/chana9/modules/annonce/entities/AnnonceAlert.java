package ma.chana9.modules.annonce.entities;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnimalDentition;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(
        name = "annonce_alerts",
        indexes = {
                @Index(name = "idx_annonce_alerts_user_id", columnList = "user_id"),
                @Index(name = "idx_annonce_alerts_is_active", columnList = "is_active"),
                @Index(name = "idx_annonce_alerts_breed", columnList = "breed"),
                @Index(name = "idx_annonce_alerts_region", columnList = "region")
        }
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceAlert {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "user_id", nullable = false)
    private UUID userId;

    @Enumerated(EnumType.STRING)
    @Column(length = 30)
    private AnimalBreed breed;

    @Column(length = 100)
    private String region;

    @Column(name = "min_price", precision = 10, scale = 2)
    private BigDecimal minPrice;

    @Column(name = "max_price", precision = 10, scale = 2)
    private BigDecimal maxPrice;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private AnimalDentition dentition;

    @Column(name = "is_active")
    @Builder.Default
    private Boolean active = true;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (active == null) active = true;
    }

    public boolean matches(Annonce annonce) {
        if (breed != null && breed != annonce.getBreed()) return false;
        if (region != null && !region.equalsIgnoreCase(annonce.getRegion())) return false;
        if (minPrice != null && annonce.getPrice().compareTo(minPrice) < 0) return false;
        if (maxPrice != null && annonce.getPrice().compareTo(maxPrice) > 0) return false;
        if (dentition != null && dentition != annonce.getDentition()) return false;
        return true;
    }
}