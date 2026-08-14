package ma.chana9.modules.annonce.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import ma.chana9.modules.user.User;
import ma.chana9.shared.enums.ReportReason;
import ma.chana9.shared.enums.ReportStatus;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(
        name = "annonce_reports",
        uniqueConstraints = @UniqueConstraint(
                name = "uq_annonce_reporter",
                columnNames = {"annonce_id", "reporter_id"}
        ),
        indexes = {
                @Index(name = "idx_annonce_reports_annonce_id", columnList = "annonce_id"),
                @Index(name = "idx_annonce_reports_reporter_id", columnList = "reporter_id"),
                @Index(name = "idx_annonce_reports_status", columnList = "status")
        }
)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceReport {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "annonce_id", nullable = false)
    private Annonce annonce;

    @Column(name = "reporter_id", nullable = false)
    private UUID reporterId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private ReportReason reason;

    @Column(columnDefinition = "text")
    private String comment;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    @Builder.Default
    private ReportStatus status = ReportStatus.PENDING;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "processed_at")
    private LocalDateTime processedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "processed_by")
    private User processedBy;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (status == null) status = ReportStatus.PENDING;
    }
}