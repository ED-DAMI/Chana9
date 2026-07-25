package ma.chana9.modules.annonce.repositories;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AnnonceFlagRepository extends JpaRepository<AnnonceFlag, UUID> {

    long countByAnnonceIdAndStatus(UUID annonceId, FlagStatus status);

    boolean existsByAnnonceIdAndReporterId(UUID annonceId, UUID reporterId);

    Page<AnnonceFlag> findByStatus(FlagStatus status, Pageable pageable);
}
