package ma.chana9.modules.sequestre;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.user.User;
import ma.chana9.shared.enums.ContactUnlockStatus;
import org.hibernate.annotations.UuidGenerator;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(
        name = "contact_unlocks",
        uniqueConstraints = @UniqueConstraint(
                name = "uq_contact_unlock_buyer_annonce",
                columnNames = {"buyer_id", "annonce_id"}
        ),
        indexes = {
                @Index(name = "idx_contact_unlocks_buyer_id", columnList = "buyer_id"),
                @Index(name = "idx_contact_unlocks_annonce_id", columnList = "annonce_id"),
                @Index(name = "idx_contact_unlocks_transaction_id", columnList = "transaction_id")
        }
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ContactUnlock {

    @Id
    @UuidGenerator
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "buyer_id", nullable = false)
    private User buyer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "annonce_id", nullable = false)
    private Annonce annonce;

    @Column(nullable = false, precision = 10, scale = 2)
    @Builder.Default
    private BigDecimal amount = new BigDecimal("20.00");

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    @Builder.Default
    private ContactUnlockStatus status = ContactUnlockStatus.PENDING;

    @Column(name = "transaction_id", length = 100, unique = true)
    private String transactionId;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    @PrePersist
    void onCreate() {
        if (createdAt == null) createdAt = LocalDateTime.now();
    }
}
