package ma.chana9.modules.annonce;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface AnnonceAlertRepository extends JpaRepository<AnnonceAlert, UUID> {

    List<AnnonceAlert> findByActiveTrue();

    List<AnnonceAlert> findByBuyerId(UUID buyerId);

    void deleteByBuyerIdAndId(UUID buyerId, UUID alertId);
}
