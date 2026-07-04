package ma.chana9.shared.security.service;

import java.time.LocalDateTime;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.shared.audit.service.AuditService;
import ma.chana9.shared.constants.AuditConstants;
import ma.chana9.shared.enums.AuditAction;
import ma.chana9.shared.security.repository.RefreshTokenRepository;
import ma.chana9.shared.security.repository.TokenBlacklistRepository;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@Slf4j
@RequiredArgsConstructor
public class TokenCleanupService {

    private final TokenBlacklistRepository tokenBlacklistRepository;
    private final RefreshTokenRepository refreshTokenRepository;
    private final AuditService auditService;

    @Scheduled(cron = "${app.security.cleanup-cron}")
    public void cleanupExpiredBlacklistedTokens() {
        tokenBlacklistRepository.deleteByExpiresAtBefore(LocalDateTime.now());
        auditService.logSuccess(AuditAction.ADMIN_ACTION, null, AuditConstants.SYSTEM_ENTITY, AuditConstants.CLEANUP_EXPIRED_TOKENS);
        log.info("Cleaned up expired blacklisted tokens");
    }

    @Scheduled(cron = "${app.security.refresh-cleanup-cron}")
    public void cleanupExpiredRefreshTokens() {
        refreshTokenRepository.deleteByExpiresAtBefore(LocalDateTime.now());
        auditService.logSuccess(AuditAction.ADMIN_ACTION, null, AuditConstants.SYSTEM_ENTITY, AuditConstants.CLEANUP_EXPIRED_TOKENS);
        log.info("Cleaned up expired refresh tokens");
    }
}