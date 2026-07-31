package ma.chana9.modules.sequestre;

import ma.chana9.shared.enums.ContactUnlockStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface ContactUnlockRepository extends JpaRepository<ContactUnlock, UUID> {

    Optional<ContactUnlock> findByBuyerIdAndAnnonceId(UUID buyerId, UUID annonceId);

    boolean existsByBuyerIdAndAnnonceIdAndStatus(UUID buyerId, UUID annonceId, ContactUnlockStatus status);

    Optional<ContactUnlock> findByTransactionId(String transactionId);
}
