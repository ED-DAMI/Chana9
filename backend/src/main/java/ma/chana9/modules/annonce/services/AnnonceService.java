package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.dto.*;
import ma.chana9.modules.annonce.entities.*;
import ma.chana9.modules.annonce.repositories.*;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.config.AnnonceConstants;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.enums.ReportStatus;
import ma.chana9.shared.exception.ApiException;
import org.locationtech.jts.geom.*;
import org.springframework.data.domain.*;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class AnnonceService {

	private static final int SRID          = 4326;
	private static final int METERS_PER_KM = 1000;

	private final AnnonceRepository      annonceRepository;
	private final FavoriteRepository     favoriteRepository;
	private final AnnonceAlertRepository annonceAlertRepository;
	private final AnnonceReportRepository annonceReportRepository;
	private final AnnonceMapper          annonceMapper;
	private final GeometryFactory        geometryFactory =
			new GeometryFactory(new PrecisionModel(), SRID);
	private final UserRepository userRepository;

	@Transactional
	public AnnonceResponse create(AnnonceRequest request, UUID sellerId) {
		Annonce annonce = Annonce.builder()
				.title(request.title())
				.description(request.description())
				.breed(request.breed())
				.price(request.price())
				.priceNegotiable(request.priceNegotiable())
				.region(request.region())
				.gender(request.gender())
				.ageMonths(request.ageMonths())
				.addressLabel(request.addressLabel())
				.deliveryAvailable(request.deliveryAvailable())
				.deliveryPrice(request.deliveryPrice())
				.location(buildPoint(request.latitude(), request.longitude()))
				.sellerId(sellerId)
				.status(AnnonceStatus.ACTIVE)
				.build();
		Annonce saved = annonceRepository.save(annonce);
		notifyMatchingAlerts(saved);
		return annonceMapper.toResponse(saved);
	}

	@Transactional
	public AnnonceResponse update(UUID id, AnnonceRequest request, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setTitle(request.title());
		annonce.setDescription(request.description());
		annonce.setBreed(request.breed());
		annonce.setPrice(request.price());
		annonce.setPriceNegotiable(request.priceNegotiable());
		annonce.setRegion(request.region());
		annonce.setGender(request.gender());
		annonce.setAgeMonths(request.ageMonths());
		annonce.setAddressLabel(request.addressLabel());
		annonce.setDeliveryAvailable(request.deliveryAvailable());
		annonce.setDeliveryPrice(request.deliveryPrice());
		annonce.setLocation(buildPoint(request.latitude(), request.longitude()));
		return annonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public void delete(UUID id, UUID sellerId) {
		annonceRepository.delete(findOwnedOrThrow(id, sellerId));
	}

	@Transactional
	public AnnonceResponse findById(UUID id) {
		Annonce annonce = findOrThrow(id);
		annonce.setViewsCount(annonce.getViewsCount()+1);
		return annonceMapper.toResponse(annonce);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> search(AnnonceSearchRequest request, Pageable pageable) {
		if (request.latitude() != null && request.longitude() != null && request.radiusKm() != null) {
			return annonceRepository.findNearby(
					request.latitude(),
					request.longitude(),
					request.radiusKm() * METERS_PER_KM,
					pageable
			).map(annonceMapper::toResponse);
		}
		return annonceRepository.findAll(AnnonceSpecification.from(request), pageable)
				.map(annonceMapper::toResponse);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> findBySeller(UUID sellerId, Pageable pageable) {
		return annonceRepository.findBySellerId(sellerId, pageable)
				.map(annonceMapper::toResponse);
	}

	@Transactional
	public AnnonceResponse suspend(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.SUSPENDED);
		return annonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse reactivate(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.ACTIVE);
		annonce.setExpiresAt(LocalDateTime.now().plusDays(AnnonceConstants.DEFAULT_EXPIRY_DAYS));
		return annonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse markAsSold(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.SOLD);
		return annonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse activateTopLot(UUID id, UUID sellerId, int durationDays) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setTopLotExpiresAt(LocalDateTime.now().plusDays(durationDays));
		return annonceMapper.toResponse(annonceRepository.save(annonce));
	}

	// ── Favoris ───────────────────────────────────────────────────────────────

	@Transactional
	public void addFavorite(UUID annonceId, UUID buyerId) {
		if (favoriteRepository.existsByBuyerIdAndAnnonceId(buyerId, annonceId)) {
			throw new ApiException(HttpStatus.CONFLICT, ErrorKeys.Favorite.ALREADY_ADDED);
		}
		Annonce annonce = findOrThrow(annonceId);
		favoriteRepository.save(Favorite.builder()
				.buyerId(buyerId)
				.annonce(annonce)
				.build());
		annonceRepository.incrementFavoritesCount(annonceId);
		log.info("favorite.added buyerId={} annonceId={}", buyerId, annonceId);
	}

	@Transactional
	public void removeFavorite(UUID annonceId, UUID buyerId) {
		if (!favoriteRepository.existsByBuyerIdAndAnnonceId(buyerId, annonceId)) {
			throw new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Favorite.NOT_FOUND);
		}
		favoriteRepository.deleteByBuyerIdAndAnnonceId(buyerId, annonceId);
		annonceRepository.decrementFavoritesCount(annonceId);
		log.info("favorite.removed buyerId={} annonceId={}", buyerId, annonceId);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> findFavorites(UUID buyerId, Pageable pageable) {
		return favoriteRepository.findByBuyerId(buyerId, pageable)
				.map(fav -> annonceMapper.toResponse(fav.getAnnonce()));
	}

	// ── Reports ───────────────────────────────────────────────────────────────

	@Transactional
	public AnnonceReportResponse report(UUID annonceId, UUID reporterId, AnnonceReportRequest request) {
		Annonce annonce = findOrThrow(annonceId);

		if (annonce.getSellerId().equals(reporterId)) {
			throw new ApiException(HttpStatus.FORBIDDEN, ErrorKeys.Report.OWN_ANNONCE);
		}

		if (annonceReportRepository.existsByAnnonceIdAndReporterId(annonceId, reporterId)) {
			throw new ApiException(HttpStatus.CONFLICT, ErrorKeys.Report.ALREADY_REPORTED);
		}

		AnnonceReport report = AnnonceReport.builder()
				.annonce(annonce)
				.reporterId(reporterId)
				.reason(request.reason())
				.comment(request.comment())
				.status(ReportStatus.PENDING)
				.build();

		AnnonceReport saved = annonceReportRepository.save(report);

		long pendingCount = annonceReportRepository.countByAnnonceIdAndStatus(annonceId, ReportStatus.PENDING);
		if (pendingCount >= AnnonceConstants.AUTO_SUSPEND_REPORT_THRESHOLD) {
			annonce.setStatus(AnnonceStatus.SUSPENDED);
			annonceRepository.save(annonce);
			log.warn("annonce.auto-suspended annonceId={} pendingReports={}", annonceId, pendingCount);
		}

		log.info("annonce.reported annonceId={} reporterId={} reason={}", annonceId, reporterId, request.reason());

		return toReportResponse(saved);
	}

	@Transactional
	public AnnonceAlert createAlert(UUID buyerId, AnnonceAlertRequest request) {
		return annonceAlertRepository.save(AnnonceAlert.builder()
				.buyerId(buyerId)
				.breed(request.breed())
				.region(request.region())
				.maxPrice(request.maxPrice())
				.dentition(request.dentition())
				.minPrice(request.minPrice())
				.active(true)
				.build());
	}

	@Transactional
	public void deleteAlert(UUID alertId, UUID buyerId) {
		annonceAlertRepository.deleteByBuyerIdAndId(buyerId, alertId);
	}

	@Transactional(readOnly = true)
	public List<AnnonceAlert> findAlertsByBuyer(UUID buyerId) {
		return annonceAlertRepository.findByBuyerId(buyerId);
	}


	private void notifyMatchingAlerts(Annonce annonce) {
		long matchCount = annonceAlertRepository.countMatchingAlerts(annonce);
		if (matchCount > 0) {
			log.info("annonce.alerts.matched annonceId={} count={}", annonce.getId(), matchCount);
		}
	}

	private Annonce findOrThrow(UUID id) {
		return annonceRepository.findById(id)
				.orElseThrow(() -> new ApiException(HttpStatus.NOT_FOUND, ErrorKeys.Annonce.NOT_FOUND));
	}

	private Annonce findOwnedOrThrow(UUID id, UUID sellerId) {
		Annonce annonce = findOrThrow(id);
		if (!annonce.getSellerId().equals(sellerId)) {
			throw new ApiException(HttpStatus.FORBIDDEN, ErrorKeys.Annonce.FORBIDDEN);
		}
		return annonce;
	}

	private Point buildPoint(Double latitude, Double longitude) {
		if (latitude == null || longitude == null) return null;
		return geometryFactory.createPoint(new Coordinate(longitude, latitude));
	}

	private AnnonceReportResponse toReportResponse(AnnonceReport report) {
		return new AnnonceReportResponse(
				report.getId(),
				report.getAnnonce().getId(),
				report.getReporterId(),
				report.getReason(),
				report.getComment(),
				report.getStatus(),
				report.getCreatedAt()
		);
	}
}