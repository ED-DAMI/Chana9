package ma.chana9.modules.annonce;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface FavoriteRepository extends JpaRepository<Favorite, UUID> {

    Page<Favorite> findByBuyerId(UUID buyerId, Pageable pageable);

    Optional<Favorite> findByBuyerIdAndAnnonceId(UUID buyerId, UUID annonceId);

    boolean existsByBuyerIdAndAnnonceId(UUID buyerId, UUID annonceId);

    void deleteByBuyerIdAndAnnonceId(UUID buyerId, UUID annonceId);
}
