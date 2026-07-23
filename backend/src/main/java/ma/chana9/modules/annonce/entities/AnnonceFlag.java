package ma.chana9.modules.annonce.entities;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.shared.enums.FlagReason;
import ma.chana9.shared.enums.FlagStatus;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(
        name = "annonce_flags",
        uniqueConstraints = @UniqueConstraint(
                name = "uq_annonce_flag",
                columnNames = {"annonce_id", "reporter_id"}
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

    @Column(name = "reporter_id", nullable = false)
    private UUID reporterId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private FlagReason reason;

    @Column(columnDefinition = "text")
    private String comment;

    @Enumerated(EnumType.STRING)
    @Column(length = 20, nullable = false)
    @Builder.Default
    private FlagStatus status = FlagStatus.PENDING;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "reviewed_at")
    private LocalDateTime reviewedAt;

    @Column(name = "reviewed_by")
    private UUID reviewedBy;

    @PrePersist
    void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = FlagStatus.PENDING;
    }
}