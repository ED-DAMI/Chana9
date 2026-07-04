package ma.chana9.shared.audit.controller;

import java.time.LocalDateTime;
import java.util.UUID;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.audit.dto.AuditLogDTO;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.ApiPaths;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Audit.BASE)
@PreAuthorize("hasRole('ADMIN')")
public class AuditController {

    private final AuditService auditService;

    @GetMapping
    public Page<AuditLogDTO> search(
            @RequestParam(required = false) UUID userId,
            @RequestParam(required = false) String action,
            @RequestParam(required = false) String entityType,
            @RequestParam(required = false) String entityId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to,
            @PageableDefault(size = 20) Pageable pageable) {
        return auditService.search(userId, action, entityType, entityId, from, to, pageable.getPageNumber(), pageable.getPageSize());
    }

    @GetMapping("/user/{userId}")
    public Page<AuditLogDTO> byUser(@PathVariable UUID userId, @PageableDefault(size = 20) Pageable pageable) {
        return auditService.findByUserId(userId, pageable);
    }

    @GetMapping("/entity/{entityType}/{entityId}")
    public Page<AuditLogDTO> byEntity(@PathVariable String entityType, @PathVariable String entityId, @PageableDefault(size = 20) Pageable pageable) {
        return auditService.findByEntityTypeAndEntityId(entityType, entityId, pageable);
    }
}