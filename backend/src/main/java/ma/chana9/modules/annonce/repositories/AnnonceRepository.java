package ma.chana9.modules.annonce.repositories;

import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.shared.enums.AnnonceStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public interface AnnonceRepository extends JpaRepository<Annonce, UUID>, JpaSpecificationExecutor<Annonce> {

    Page<Annonce> findBySellerId(UUID sellerId, Pageable pageable);

    Page<Annonce> findBySellerIdAndStatus(UUID sellerId, AnnonceStatus status, Pageable pageable);

    @Query("SELECT a FROM Annonce a WHERE a.status = :status AND a.expiresAt < :now")
    List<Annonce> findExpired(@Param("status") AnnonceStatus status, @Param("now") LocalDateTime now);

    @Query("SELECT a FROM Annonce a WHERE a.isTopLot = true AND a.topLotExpiresAt < :now")
    List<Annonce> findExpiredTopLots(@Param("now") LocalDateTime now);

    @Modifying
    @Query("UPDATE Annonce a SET a.status = :status WHERE a.id IN :ids")
    void updateStatusByIds(@Param("ids") List<UUID> ids, @Param("status") AnnonceStatus status);

    @Query("""
            SELECT a FROM Annonce a
            WHERE a.status = 'ACTIVE'
            AND function('ST_DWithin',
                a.location,
                function('ST_MakePoint', :lng, :lat),
                :radiusMeters) = true
            ORDER BY function('ST_Distance', a.location, function('ST_MakePoint', :lng, :lat))
            """)
    Page<Annonce> findNearby(
            @Param("lat") double lat,
            @Param("lng") double lng,
            @Param("radiusMeters") double radiusMeters,
            Pageable pageable
    );

    long countBySellerIdAndStatus(UUID sellerId, AnnonceStatus status);
}
