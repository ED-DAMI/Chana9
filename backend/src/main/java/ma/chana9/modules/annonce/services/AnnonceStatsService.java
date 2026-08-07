package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;
import ma.chana9.modules.annonce.dto.AnnonceStatsDTO;
import ma.chana9.modules.annonce.dto.RevenuePointDTO;
import ma.chana9.modules.annonce.dto.SellerGlobalStatsDTO;
import ma.chana9.modules.annonce.dto.SellerRevenueDTO;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceMedia;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.sequestre.ContactUnlockRepository;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.enums.ContactUnlockStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AnnonceStatsService {

    private final AnnonceRepository annonceRepository;
    private final ContactUnlockRepository contactUnlockRepository;
    @Transactional(readOnly = true)
    public SellerGlobalStatsDTO getGlobalStats(UUID sellerId) {
        long totalViews     = annonceRepository.sumViewsBySeller(sellerId);
        long totalFavorites = annonceRepository.sumFavoritesBySeller(sellerId);
        long totalContacts  = contactUnlockRepository.countByBuyer_IdAndStatus(
                sellerId, ContactUnlockStatus.COMPLETED
        );
        int totalAnnonces  = annonceRepository.countTotalBySeller(sellerId);
        int activeAnnonces = annonceRepository.countBySellerAndStatus(sellerId, AnnonceStatus.ACTIVE);
        int soldAnnonces   = annonceRepository.countBySellerAndStatus(sellerId, AnnonceStatus.SOLD);

        return SellerGlobalStatsDTO.of(
                totalViews, totalFavorites, totalContacts,
                totalAnnonces, activeAnnonces, soldAnnonces
        );
    }

    @Transactional(readOnly = true)
    public SellerRevenueDTO getRevenue(UUID sellerId, String period) {
        LocalDate[] range   = resolvePeriodRange(period);
        LocalDateTime start = range[0].atStartOfDay();
        LocalDateTime end   = range[1].atTime(23, 59, 59);

        BigDecimal totalRevenue = annonceRepository.sumRevenueBySeller(sellerId, start, end);
        int soldCount           = annonceRepository.countSoldBySeller(sellerId, start, end);
        BigDecimal averagePrice = annonceRepository.avgPriceBySeller(sellerId, start, end);

        return new SellerRevenueDTO(
                period,
                totalRevenue != null ? totalRevenue : BigDecimal.ZERO,
                "MAD",
                soldCount,
                averagePrice != null ? averagePrice : BigDecimal.ZERO,
                range[0],
                range[1]
        );
    }

    @Transactional(readOnly = true)
    public List<RevenuePointDTO> getRevenueChart(UUID sellerId, String period) {
        LocalDate[] range   = resolvePeriodRange(period);
        LocalDateTime start = range[0].atStartOfDay();
        LocalDateTime end   = range[1].atTime(23, 59, 59);

        return annonceRepository
                .findRevenuePointsBySeller(sellerId, start, end)
                .stream()
                .map(p -> new RevenuePointDTO(p.getDate(), p.getRevenue(), p.getSoldCount()))
                .toList();
    }

    @Transactional(readOnly = true)
    public List<AnnonceStatsDTO> getAnnonceStats(UUID sellerId) {
        return annonceRepository
                .findAllBySellerIdOrderByViewsCountDesc(sellerId)
                .stream()
                .map(this::toAnnonceStatsDTO)
                .toList();
    }

    @Transactional
    public void incrementView(UUID annonceId) {
        annonceRepository.incrementViewsCount(annonceId);
    }

    private AnnonceStatsDTO toAnnonceStatsDTO(Annonce annonce) {
        String mainPhotoUrl = annonce.getMedias().stream()
                .filter(AnnonceMedia::getIsCover)
                .findFirst()
                .map(AnnonceMedia::getUrl)
                .orElse(null);

        return new AnnonceStatsDTO(
                annonce.getId().toString(),
                annonce.getTitle(),
                annonce.getStatus(),
                annonce.getPrice(),
                annonce.getViewsCount(),
                annonce.getFavoritesCount(),
                0L,
                annonce.getSoldAt(),
                mainPhotoUrl
        );
    }

    private LocalDate[] resolvePeriodRange(String period) {
        LocalDate today = LocalDate.now();
        return switch (period) {
            case "week"  -> new LocalDate[]{ today.minusWeeks(1), today };
            case "year"  -> new LocalDate[]{ today.minusYears(1), today };
            default      -> new LocalDate[]{ today.minusMonths(1), today };
        };
    }
}
