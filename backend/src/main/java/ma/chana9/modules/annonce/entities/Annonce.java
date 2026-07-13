package ma.chana9.modules.annonce.entities;

import jakarta.persistence.*;
import lombok.*;

import ma.chana9.shared.enums.AnimalGender;
import ma.chana9.shared.enums.AnnonceStatus;
import org.locationtech.jts.geom.Point;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "annonces")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Annonce {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(columnDefinition = "text")
    private String description;

    @Column(name = "breed", nullable = false, length = 100)
    private String breed;

    @Column(name = "estimated_weight", precision = 6, scale = 2)
    private BigDecimal estimatedWeight;

    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "price_negotiable")
    @Builder.Default
    private Boolean priceNegotiable = false;

    @Column(nullable = false, length = 100)
    private String region;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", length = 20)
    @Builder.Default
    private AnnonceStatus status = AnnonceStatus.ACTIVE;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", length = 10)
    private AnimalGender gender;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @Column(name = "age_months")
    private Integer ageMonths;

    @Column(name = "location", columnDefinition = "geometry(Point, 4326)")
    private Point location;

    @Column(name = "address_label", length = 255)
    private String addressLabel;

    @Column(name = "delivery_available")
    @Builder.Default
    private Boolean deliveryAvailable = false;

    @Column(name = "delivery_radius_km")
    private Integer deliveryRadiusKm;

    @Column(name = "delivery_price", precision = 8, scale = 2)
    private BigDecimal deliveryPrice;

    @Column(name = "is_top_lot")
    @Builder.Default
    private Boolean isTopLot = false;

    @Column(name = "top_lot_expires_at")
    private LocalDateTime topLotExpiresAt;

    @Column(name = "expires_at")
    private LocalDateTime expiresAt;

    @Column(name = "seller_id", nullable = false)
    private UUID sellerId;

    @OneToMany(mappedBy = "annonce", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<AnnonceMedia> medias = new ArrayList<>();

    @OneToMany(mappedBy = "annonce", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<AnnonceReport> reports = new ArrayList<>();

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

}