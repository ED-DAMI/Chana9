package ma.chana9.modules.annonce.entities;

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
    @Column(name = "is_active")
    @Builder.Default
    private Boolean active = true;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

}
