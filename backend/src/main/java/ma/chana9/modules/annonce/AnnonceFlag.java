package ma.chana9.modules.annonce;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.shared.enums.FlagReason;
import ma.chana9.shared.enums.FlagStatus;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(
        name = "annonce_signalements",
        uniqueConstraints = @UniqueConstraint(
                name = "idx_signalement_unique",
                columnNames = {"annonce_id", "signaleur_id"}
        )
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceFlag {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "annonce_id", nullable = false)
    private Annonce annonce;

    @Column(name = "signaleur_id", nullable = false)
    private UUID reporterId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private FlagReason reason;

    @Column(columnDefinition = "text")
    private String comment;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    @Builder.Default
    private FlagStatus status = FlagStatus.PENDING;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "traite_at")
    private LocalDateTime reviewedAt;

    @Column(name = "traite_par")
    private UUID reviewedBy;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = FlagStatus.PENDING;
    }
}