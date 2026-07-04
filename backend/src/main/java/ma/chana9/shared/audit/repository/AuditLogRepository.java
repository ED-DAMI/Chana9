package ma.chana9.shared.audit.repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import ma.chana9.shared.audit.domain.AuditLog;

public interface AuditLogRepository extends JpaRepository<AuditLog, UUID>, JpaSpecificationExecutor<AuditLog> {

    @Query("select a from AuditLog a where a.user.id = :userId")
    Page<AuditLog> findByUserId(@Param("userId") UUID userId, Pageable pageable);

    @Query("select a from AuditLog a where a.action = :action")
    Page<AuditLog> findByAction(@Param("action") String action, Pageable pageable);

    @Query("select a from AuditLog a where a.entityType = :type and a.entityId = :id")
    Page<AuditLog> findByEntityTypeAndEntityId(@Param("type") String type, @Param("id") String id, Pageable pageable);

    @Query("select a from AuditLog a where a.user.id = :userId and a.createdAt between :from and :to")
    List<AuditLog> findByUserIdAndCreatedAtBetween(@Param("userId") UUID userId, @Param("from") LocalDateTime from, @Param("to") LocalDateTime to);
}