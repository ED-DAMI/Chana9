package ma.chana9.modules.annonce.repositories;

import ma.chana9.modules.annonce.entities.AnnonceReport;
import ma.chana9.shared.enums.ReportStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AnnonceReportRepository extends JpaRepository<AnnonceReport, UUID> {

    boolean existsByAnnonceIdAndReporterId(UUID annonceId, UUID reporterId);

    long countByAnnonceIdAndStatus(UUID annonceId, ReportStatus status);

    Page<AnnonceReport> findByStatus(ReportStatus status, Pageable pageable);

    Page<AnnonceReport> findByAnnonceId(UUID annonceId, Pageable pageable);
}