package ma.chana9.modules.user;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;


public interface OtpCodeRepository extends JpaRepository<OtpCode, Long> {

    Optional<OtpCode> findByPhoneAndCode(String phone, String code);

    @Modifying
    @Query("DELETE FROM OtpCode o WHERE o.phone = :phone")
    void deleteByPhone(@Param("phone") String phone);

    @Modifying
    @Query("DELETE FROM OtpCode o WHERE o.expiresAt < :now")
    void deleteAllExpired(@Param("now") LocalDateTime now);
}