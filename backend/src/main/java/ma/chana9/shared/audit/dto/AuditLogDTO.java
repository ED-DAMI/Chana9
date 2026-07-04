package ma.chana9.shared.audit.dto;

import java.time.LocalDateTime;
import java.util.UUID;

import lombok.Builder;
import lombok.Data;
import ma.chana9.shared.audit.domain.AuditLog;

@Data
@Builder
public class AuditLogDTO {

    private UUID id;
    private String userId;
    private String userPhone;
    private String action;
    private String entityType;
    private String entityId;
    private String ipAddress;
    private String status;
    private String errorMessage;
    private LocalDateTime createdAt;

    public static AuditLogDTO from(AuditLog auditLog) {
        return AuditLogDTO.builder()
                .id(auditLog.getId())
                .userId(auditLog.getUser() != null ? auditLog.getUser().getId().toString() : null)
                .userPhone(auditLog.getUser() != null ? auditLog.getUser().getPhone() : null)
                .action(auditLog.getAction())
                .entityType(auditLog.getEntityType())
                .entityId(auditLog.getEntityId())
                .ipAddress(auditLog.getIpAddress())
                .status(auditLog.getStatus())
                .errorMessage(auditLog.getErrorMessage())
                .createdAt(auditLog.getCreatedAt())
                .build();
    }
}