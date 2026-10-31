package ma.chana9.shared.security.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ma.chana9.shared.security.domain.RefreshToken;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {

    Optional<RefreshToken> findByTokenHashAndIsRevokedFalse(String tokenHash);

    List<RefreshToken> findByUserIdAndIsRevokedFalse(UUID userId);

    @Modifying
    @Query("update RefreshToken r set r.isRevoked = true where r.user.id = :userId")
    void revokeAllByUserId(@Param("userId") UUID userId);

    void deleteByExpiresAtBefore(LocalDateTime now);


    Optional<RefreshToken> findByTokenHash(String tokenHash);
}