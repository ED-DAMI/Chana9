package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.shared.enums.AnnonceStatus;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class AnnonceScheduler {

    private final AnnonceRepository annonceRepository;

    @Scheduled(cron = "0 0 * * * *")
    @Transactional
    public void expireAnnonces() {
        List<Annonce> expired = annonceRepository.findExpired(AnnonceStatus.ACTIVE, LocalDateTime.now());
        if (expired.isEmpty()) return;

        List<java.util.UUID> ids = expired.stream().map(Annonce::getId).toList();
        annonceRepository.updateStatusByIds(ids, AnnonceStatus.EXPIRED);
        log.info("annonces.expired count={}", ids.size());
    }

    @Scheduled(cron = "0 0 * * * *")
    @Transactional
    public void expireTopLots() {
        List<Annonce> expired = annonceRepository.findExpiredTopLots(LocalDateTime.now());
        if (expired.isEmpty()) return;

        expired.forEach(a -> {
            a.setTopLotExpiresAt(null);
        });
        annonceRepository.saveAll(expired);
        log.info("top.lots.expired count={}", expired.size());
    }
}
