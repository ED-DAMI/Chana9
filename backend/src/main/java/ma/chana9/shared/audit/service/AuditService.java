package ma.chana9.shared.audit.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import ma.chana9.shared.audit.domain.AuditLog;
import ma.chana9.shared.audit.repository.AuditLogRepository;
import ma.chana9.shared.audit.dto.AuditLogDTO;
import ma.chana9.shared.constants.EntityFields;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.enums.AuditStatus;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AuditService {

    private final AuditLogRepository auditLogRepository;
    private final UserRepository userRepository;
    private final ObjectMapper objectMapper;

    @Async
    @Transactional
    public void log(AuditAction action, UUID userId, String entityType, String entityId, Object oldValue, Object newValue, HttpServletRequest request, AuditStatus status) {
        persist(action, userId, entityType, entityId, oldValue, newValue, request, status, null);
    }

    @Async
    @Transactional
    public void logSuccess(AuditAction action, UUID userId, String entityType, String entityId) {
        persist(action, userId, entityType, entityId, null, null, null, AuditStatus.SUCCESS, null);
    }

    @Async
    @Transactional
    public void logSuccess(AuditAction action, UUID userId) {
        persist(action, userId, null, null, null, null, null, AuditStatus.SUCCESS, null);
    }

    @Async
    @Transactional
    public void logFailure(AuditAction action, UUID userId, String errorMessage, HttpServletRequest request) {
        persist(action, userId, null, null, null, null, request, AuditStatus.FAILURE, errorMessage);
    }

    public Page<AuditLogDTO> search(UUID userId, String action, String entityType, String entityId, LocalDateTime from, LocalDateTime to, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, EntityFields.AuditLog.CREATED_AT));
        Specification<AuditLog> specification = (root, query, builder) -> builder.conjunction();
        if (userId != null) {
            specification = specification.and((root, query, builder) -> builder.equal(root.get(EntityFields.AuditLog.USER).get(EntityFields.Common.ID), userId));
        }
        if (action != null) {
            specification = specification.and((root, query, builder) -> builder.equal(root.get(EntityFields.AuditLog.ACTION), action));
        }
        if (entityType != null) {
            specification = specification.and((root, query, builder) -> builder.equal(root.get(EntityFields.AuditLog.ENTITY_TYPE), entityType));
        }
        if (entityId != null) {
            specification = specification.and((root, query, builder) -> builder.equal(root.get(EntityFields.AuditLog.ENTITY_ID), entityId));
        }
        if (from != null) {
            specification = specification.and((root, query, builder) -> builder.greaterThanOrEqualTo(root.get(EntityFields.AuditLog.CREATED_AT), from));
        }
        if (to != null) {
            specification = specification.and((root, query, builder) -> builder.lessThanOrEqualTo(root.get(EntityFields.AuditLog.CREATED_AT), to));
        }
        return auditLogRepository.findAll(specification, pageable).map(AuditLogDTO::from);
    }

    public Page<AuditLogDTO> findByUserId(UUID userId, Pageable pageable) {
        return auditLogRepository.findByUserId(userId, pageable).map(AuditLogDTO::from);
    }

    public Page<AuditLogDTO> findByAction(String action, Pageable pageable) {
        return auditLogRepository.findByAction(action, pageable).map(AuditLogDTO::from);
    }

    public Page<AuditLogDTO> findByEntityTypeAndEntityId(String type, String id, Pageable pageable) {
        return auditLogRepository.findByEntityTypeAndEntityId(type, id, pageable).map(AuditLogDTO::from);
    }

    public List<AuditLogDTO> findByUserIdAndCreatedAtBetween(UUID userId, LocalDateTime from, LocalDateTime to) {
        return auditLogRepository.findByUserIdAndCreatedAtBetween(userId, from, to).stream().map(AuditLogDTO::from).toList();
    }

    public void persist(AuditAction action, UUID userId, String entityType, String entityId, Object oldValue, Object newValue, HttpServletRequest request, AuditStatus status, String errorMessage) {
        try {
            AuditLog auditLog = AuditLog.builder()
                    .user(resolveUser(userId))
                    .action(action.name())
                    .entityType(entityType)
                    .entityId(entityId)
                    .oldValue(serialize(oldValue))
                    .newValue(serialize(newValue))
                    .ipAddress(request != null ? request.getRemoteAddr() : null)
                    .userAgent(request != null ? request.getHeader(HttpHeaders.USER_AGENT) : null)
                    .status(status.name())
                    .errorMessage(errorMessage)
                    .build();
            auditLogRepository.save(auditLog);
        } catch (Exception ignored) {
        }
    }

    private User resolveUser(UUID userId) {
        if (userId == null) {
            return null;
        }
        return userRepository.findById(userId).orElse(null);
    }

    private String serialize(Object value) {
        if (value == null) {
            return null;
        }
        try {
            return objectMapper.writeValueAsString(value);
        } catch (Exception exception) {
            return null;
        }
    }
}