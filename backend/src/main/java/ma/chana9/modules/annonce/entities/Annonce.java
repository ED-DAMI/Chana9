package ma.chana9.modules.annonce.entities;

import jakarta.persistence.*;
import lombok.*;

import ma.chana9.shared.enums.*;
import org.locationtech.jts.geom.Point;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(
        name = "annonces",
        indexes = {
                @Index(name = "idx_annonces_status_breed", columnList = "status, breed"),
                @Index(name = "idx_annonces_region", columnList = "region"),
                @Index(name = "idx_annonces_seller_id", columnList = "seller_id"),
                @Index(name = "idx_annonces_expires_at", columnList = "expires_at"),
                @Index(name = "idx_annonces_top_lot_expires_at", columnList = "top_lot_expires_at")
        }
)
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

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private AnimalBreed breed;

    @Enumerated(EnumType.STRING)
    @Column(length = 10)
    private AnimalGender gender;

    @Column(name = "age_months")
    private Integer ageMonths;

    @Column(name = "weight_kg", precision = 6, scale = 2)
    private BigDecimal weightKg;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private AnimalDentition dentition;

    @Column(name = "onssa_tag_number", length = 50)
    private String onssaTagNumber;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Enumerated(EnumType.STRING)
    @Column(name = "price_type", length = 20)
    @Builder.Default
    private PriceType priceType = PriceType.FIXED;

    @Column(name = "price_negotiable")
    @Builder.Default
    private Boolean priceNegotiable = false;

    @Column(name = "head_count")
    @Builder.Default
    private Integer headCount = 1;

    @Column(nullable = false, length = 100)
    private String region;

    @Column(name = "address_label", length = 255)
    private String addressLabel;

    @Column(columnDefinition = "geometry(Point, 4326)")
    private Point location;

    @Column(name = "delivery_available")
    @Builder.Default
    private Boolean deliveryAvailable = false;

    @Column(name = "delivery_price", precision = 8, scale = 2)
    private BigDecimal deliveryPrice;

    @Column(name = "boarding_available")
    @Builder.Default
    private Boolean boardingAvailable = false;

    @Column(name = "boarding_daily_price", precision = 6, scale = 2)
    private BigDecimal boardingDailyPrice;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    @Builder.Default
    private AnnonceStatus status = AnnonceStatus.ACTIVE;

    @Column(name = "top_lot_expires_at")
    private LocalDateTime topLotExpiresAt;

    @Column(name = "views_count")
    @Builder.Default
    private Long viewsCount = 0L;

    @Column(name = "favorites_count")
    @Builder.Default
    private Long favoritesCount = 0L;

    @Column(name = "expires_at", nullable = false)
    private LocalDateTime expiresAt;

    @Column(name = "seller_id", nullable = false)
    private UUID sellerId;

    @OneToMany(mappedBy = "annonce", fetch = FetchType.LAZY,cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<AnnonceMedia> medias = new ArrayList<>();

    @OneToMany(mappedBy = "annonce", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<AnnonceReport> reports = new ArrayList<>();

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
    
    @Column(name = "sold_at")
    private LocalDateTime soldAt;

    public boolean isTopLot() {
        return topLotExpiresAt != null && topLotExpiresAt.isAfter(LocalDateTime.now());
    }

    public boolean isEligibleForAid() {
        if (dentition != null) {
            return dentition != AnimalDentition.MILK_TEETH;
        }
        return ageMonths != null && ageMonths >= 12;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        if (status == null) status = AnnonceStatus.ACTIVE;
        if (expiresAt == null) expiresAt = createdAt.plusDays(30);
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}