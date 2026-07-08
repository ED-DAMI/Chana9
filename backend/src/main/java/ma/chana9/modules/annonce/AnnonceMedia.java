package ma.chana9.modules.annonce;

import jakarta.persistence.*;
import lombok.*;
import ma.chana9.shared.enums.MediaFormat;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "annonce_medias")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AnnonceMedia {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "annonce_id", nullable = false)
    private Annonce annonce;

    @Column(nullable = false, length = 512)
    private String url;

    @Column
    @Builder.Default
    private Integer order = 0;

    @Column(name = "is_principale")
    @Builder.Default
    private Boolean isCover = false;

    @Enumerated(EnumType.STRING)
    @Column(length = 10)
    private MediaFormat format;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}
