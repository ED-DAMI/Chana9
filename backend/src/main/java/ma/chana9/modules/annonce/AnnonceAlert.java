package ma.chana9.modules.annonce;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "alertes_annonces")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceAlert {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "acheteur_id", nullable = false)
    private UUID buyerId;

    // ── Filter criteria ──────────────────────────────────────────────────────

    @Column(length = 100)
    private String breed;

    @Column(length = 100)
    private String region;

    @Column(name = "rayon_km")
    private Integer radiusKm;

    @Column(name = "prix_max", precision = 10, scale = 2)
    private BigDecimal maxPrice;

    @Column(name = "age_mois_min")
    private Integer minAgeMonths;

    // ── State ────────────────────────────────────────────────────────────────

    @Column(name = "is_active")
    @Builder.Default
    private Boolean active = true;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (active == null) active = true;
    }

    /**
     * Returns true if the given annonce matches this alert's criteria.
     */
    public boolean matches(Annonce annonce) {
        if (breed != null && !breed.equalsIgnoreCase(annonce.getBreed())) return false;
        if (region != null && !region.equalsIgnoreCase(annonce.getRegion())) return false;
        if (maxPrice != null && annonce.getPrice().compareTo(maxPrice) > 0) return false;
        if (minAgeMonths != null) {
            Integer age = annonce.getEffectiveAgeMonths();
            if (age == null || age < minAgeMonths) return false;
        }
        return true;
    }
}
