package ma.chana9.modules.annonce.repositories;

import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceAlert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;

public interface AnnonceAlertRepository extends JpaRepository<AnnonceAlert, UUID> {

    List<AnnonceAlert> findByActiveTrue();

    List<AnnonceAlert> findByBuyerId(UUID buyerId);

    void deleteByBuyerIdAndId(UUID buyerId, UUID alertId);

    @Query("""
        SELECT COUNT(a) FROM AnnonceAlert a
        WHERE a.active = true
          AND (a.breed   IS NULL OR a.breed   = :#{#annonce.breed})
          AND (a.region  IS NULL OR a.region  = :#{#annonce.region})
          AND (a.maxPrice IS NULL OR a.maxPrice >= :#{#annonce.price})
          AND (a.dentition IS NULL OR a.dentition = :#{#annonce.dentition})
        """)
    long countMatchingAlerts(@Param("annonce") Annonce annonce);
}
