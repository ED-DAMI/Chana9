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

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public interface AnnonceRepository extends JpaRepository<Annonce, UUID>, JpaSpecificationExecutor<Annonce> {

    Page<Annonce> findBySellerId(UUID sellerId, Pageable pageable);

    @Query("SELECT a FROM Annonce a WHERE a.status = :status AND a.expiresAt < :now")
    List<Annonce> findExpired(@Param("status") AnnonceStatus status, @Param("now") LocalDateTime now);

    @Query("SELECT a FROM Annonce a WHERE a.topLotExpiresAt IS NOT NULL AND a.topLotExpiresAt < :now")
    List<Annonce> findExpiredTopLots(@Param("now") LocalDateTime now);

    @Modifying
    @Query("UPDATE Annonce a SET a.status = :status WHERE a.id IN :ids")
    void updateStatusByIds(@Param("ids") List<UUID> ids, @Param("status") AnnonceStatus status);

    @Modifying
    @Query("UPDATE Annonce a SET a.favoritesCount = a.favoritesCount + 1 WHERE a.id = :id")
    void incrementFavoritesCount(@Param("id") UUID id);

    @Modifying
    @Query("UPDATE Annonce a SET a.favoritesCount = GREATEST(a.favoritesCount - 1, 0) WHERE a.id = :id")
    void decrementFavoritesCount(@Param("id") UUID id);

    @Query(
            value = """
            SELECT a.* FROM annonces a
            WHERE a.status = 'ACTIVE'
            AND ST_DWithin(
                a.location::geography,
                ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography,
                :radiusMeters
            )
            ORDER BY a.location <-> ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)
            """,
            countQuery = """
            SELECT COUNT(*) FROM annonces a
            WHERE a.status = 'ACTIVE'
            AND ST_DWithin(
                a.location::geography,
                ST_SetSRID(ST_MakePoint(:lng, :lat), 4326)::geography,
                :radiusMeters
            )
            """,
            nativeQuery = true
    )
    Page<Annonce> findNearby(
            @Param("lat") double lat,
            @Param("lng") double lng,
            @Param("radiusMeters") double radiusMeters,
            Pageable pageable
    );

    long countBySellerIdAndStatus(UUID sellerId, AnnonceStatus status);

    long countBySellerId(UUID sellerId);



    @Query("""
            SELECT COALESCE(SUM(a.viewsCount), 0)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
            """)
    long sumViewsBySeller(@Param("sellerId") UUID sellerId);

    @Query("""
            SELECT COALESCE(SUM(a.favoritesCount), 0)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
            """)
    long sumFavoritesBySeller(@Param("sellerId") UUID sellerId);

    @Query("""
            SELECT COUNT(a)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
            """)
    int countTotalBySeller(@Param("sellerId") UUID sellerId);

    @Query("""
            SELECT COUNT(a)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
              AND a.status = :status
            """)
    int countBySellerAndStatus(
            @Param("sellerId") UUID sellerId,
            @Param("status") AnnonceStatus status
    );

    @Query("""
            SELECT COALESCE(SUM(a.price), 0)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
              AND a.status = 'SOLD'
              AND a.soldAt BETWEEN :start AND :end
            """)
    BigDecimal sumRevenueBySeller(
            @Param("sellerId") UUID sellerId,
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    @Query("""
            SELECT COUNT(a)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
              AND a.status = 'SOLD'
              AND a.soldAt BETWEEN :start AND :end
            """)
    int countSoldBySeller(
            @Param("sellerId") UUID sellerId,
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    @Query("""
            SELECT AVG(a.price)
            FROM Annonce a
            WHERE a.sellerId = :sellerId
              AND a.status = 'SOLD'
              AND a.soldAt BETWEEN :start AND :end
            """)
    BigDecimal avgPriceBySeller(
            @Param("sellerId") UUID sellerId,
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    // =========================================================================
    // COURBE REVENUS (points journaliers)
    // =========================================================================

    @Query(value = """
            SELECT
                DATE(a.sold_at)        AS date,
                COALESCE(SUM(a.price), 0) AS revenue,
                COUNT(a.id)            AS sold_count
            FROM annonces a
            WHERE a.seller_id = :sellerId
              AND a.status = 'SOLD'
              AND a.sold_at BETWEEN :start AND :end
            GROUP BY DATE(a.sold_at)
            ORDER BY DATE(a.sold_at)
            """, nativeQuery = true)
    List<ma.chana9.modules.annonce.repositories.RevenuePointProjection> findRevenuePointsBySeller(
            @Param("sellerId") UUID sellerId,
            @Param("start") LocalDateTime start,
            @Param("end") LocalDateTime end
    );

    @Query("""
            SELECT a
            FROM Annonce a
            WHERE a.sellerId = :sellerId
            ORDER BY a.viewsCount DESC
            """)
    List<Annonce> findAllBySellerIdOrderByViewsCountDesc(@Param("sellerId") UUID sellerId);

    @Modifying
    @Query("""
            UPDATE Annonce a
            SET a.viewsCount = a.viewsCount + 1
            WHERE a.id = :annonceId
            """)
    void incrementViewsCount(@Param("annonceId") UUID annonceId);

    @Modifying
    @Query("""
            UPDATE Annonce a
            SET a.status = 'SOLD',
                a.soldAt = :soldAt
            WHERE a.id = :annonceId
              AND a.sellerId = :sellerId
            """)
    int markAsSold(
            @Param("annonceId") UUID annonceId,
            @Param("sellerId") UUID sellerId,
            @Param("soldAt") LocalDateTime soldAt
    );
}