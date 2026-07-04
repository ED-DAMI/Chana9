package ma.chana9.modules.annonce;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.hibernate.annotations.UuidGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Id;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import ma.chana9.modules.user.User;
import ma.chana9.shared.enums.StatutAnnonce;

@Entity
@Table(name = "annonces")
@Getter
@Setter
public class Annonce {

    @Id
    @UuidGenerator
    private UUID id;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "text")
    private String description;

    private String race;

    private Double poids;

    private BigDecimal prix;

    private String region;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "annonce_photos", joinColumns = @JoinColumn(name = "annonce_id"))
    @Column(name = "photo_url", nullable = false)
    private List<String> photos = new ArrayList<>();

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private StatutAnnonce statut;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "eleveur_id", nullable = false)
    private User eleveur;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
}
