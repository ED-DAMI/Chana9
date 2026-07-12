package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.dto.*;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceAlert;
import ma.chana9.modules.annonce.entities.AnnonceFlag;
import ma.chana9.modules.annonce.entities.Favorite;
import ma.chana9.modules.annonce.repositories.*;
import ma.chana9.shared.config.AnnonceConstants;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.enums.FlagStatus;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class AnnonceService {

	private static final int SRID = 4326;
	private static final int METERS_PER_KM = 1000;

	private final AnnonceRepository annonceRepository;
	private final AnnonceMediaRepository annonceMediaRepository;
	private final AnnonceFlagRepository annonceFlagRepository;
	private final FavoriteRepository favoriteRepository;
	private final AnnonceAlertRepository annonceAlertRepository;
	private final GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), SRID);

	@Transactional
	public AnnonceResponse create(AnnonceRequest request, UUID sellerId) {
		Annonce annonce = Annonce.builder()
				.title(request.getTitle())
				.description(request.getDescription())
				.breed(request.getBreed())
				.estimatedWeight(request.getEstimatedWeight())
				.price(request.getPrice())
				.priceNegotiable(request.getPriceNegotiable())
				.region(request.getRegion())
				.gender(request.getGender())
				.birthDate(request.getBirthDate())
				.ageMonths(request.getAgeMonths())
				.addressLabel(request.getAddressLabel())
				.deliveryAvailable(request.getDeliveryAvailable())
				.deliveryRadiusKm(request.getDeliveryRadiusKm())
				.deliveryPrice(request.getDeliveryPrice())
				.location(buildPoint(request.getLatitude(), request.getLongitude()))
				.sellerId(sellerId)
				.status(AnnonceStatus.ACTIVE)
				.build();

		Annonce saved = annonceRepository.save(annonce);
		notifyMatchingAlerts(saved);
		return AnnonceMapper.toResponse(saved);
	}

	@Transactional
	public AnnonceResponse update(UUID id, AnnonceRequest request, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);

		annonce.setTitle(request.getTitle());
		annonce.setDescription(request.getDescription());
		annonce.setBreed(request.getBreed());
		annonce.setEstimatedWeight(request.getEstimatedWeight());
		annonce.setPrice(request.getPrice());
		annonce.setPriceNegotiable(request.getPriceNegotiable());
		annonce.setRegion(request.getRegion());
		annonce.setGender(request.getGender());
		annonce.setBirthDate(request.getBirthDate());
		annonce.setAgeMonths(request.getAgeMonths());
		annonce.setAddressLabel(request.getAddressLabel());
		annonce.setDeliveryAvailable(request.getDeliveryAvailable());
		annonce.setDeliveryRadiusKm(request.getDeliveryRadiusKm());
		annonce.setDeliveryPrice(request.getDeliveryPrice());
		annonce.setLocation(buildPoint(request.getLatitude(), request.getLongitude()));

		return AnnonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public void delete(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonceRepository.delete(annonce);
	}

	@Transactional(readOnly = true)
	public AnnonceResponse findById(UUID id) {
		return AnnonceMapper.toResponse(findOrThrow(id));
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> search(AnnonceSearchRequest request, Pageable pageable) {
		if (request.getLatitude() != null && request.getLongitude() != null && request.getRadiusKm() != null) {
			return annonceRepository.findNearby(
					request.getLatitude(),
					request.getLongitude(),
					request.getRadiusKm() * METERS_PER_KM,
					pageable
			).map(AnnonceMapper::toResponse);
		}
		return annonceRepository.findAll(AnnonceSpecification.from(request), pageable)
				.map(AnnonceMapper::toResponse);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> findBySeller(UUID sellerId, Pageable pageable) {
		return annonceRepository.findBySellerId(sellerId, pageable)
				.map(AnnonceMapper::toResponse);
	}

	@Transactional
	public AnnonceResponse suspend(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.SUSPENDED);
		return AnnonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse reactivate(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.ACTIVE);
		annonce.setExpiresAt(LocalDateTime.now().plusDays(AnnonceConstants.DEFAULT_EXPIRY_DAYS));
		return AnnonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse markAsSold(UUID id, UUID sellerId) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setStatus(AnnonceStatus.SOLD);
		return AnnonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public AnnonceResponse activateTopLot(UUID id, UUID sellerId, int durationDays) {
		Annonce annonce = findOwnedOrThrow(id, sellerId);
		annonce.setIsTopLot(true);
		annonce.setTopLotExpiresAt(LocalDateTime.now().plusDays(durationDays));
		return AnnonceMapper.toResponse(annonceRepository.save(annonce));
	}

	@Transactional
	public void flag(UUID annonceId, UUID reporterId, AnnonceFlagRequest request) {
		if (annonceFlagRepository.existsByAnnonceIdAndReporterId(annonceId, reporterId)) {
			throw new IllegalStateException("annonce.flag.already.reported");
		}

		Annonce annonce = findOrThrow(annonceId);

		AnnonceFlag flag = AnnonceFlag.builder()
				.annonce(annonce)
				.reporterId(reporterId)
				.reason(request.getReason())
				.comment(request.getComment())
				.status(FlagStatus.PENDING)
				.build();

		annonceFlagRepository.save(flag);

		long pendingCount = annonceFlagRepository.countByAnnonceIdAndStatus(annonceId, FlagStatus.PENDING);
		if (pendingCount >= AnnonceConstants.AUTO_SUSPEND_FLAG_THRESHOLD) {
			annonce.setStatus(AnnonceStatus.SUSPENDED);
			annonceRepository.save(annonce);
			log.info("annonce.auto.suspended id={} flags={}", annonceId, pendingCount);
		}
	}

	@Transactional
	public void addFavorite(UUID annonceId, UUID buyerId) {
		if (favoriteRepository.existsByBuyerIdAndAnnonceId(buyerId, annonceId)) {
			throw new IllegalStateException("annonce.favorite.already.added");
		}
		Favorite favorite = Favorite.builder()
				.buyerId(buyerId)
				.annonce(findOrThrow(annonceId))
				.build();
		favoriteRepository.save(favorite);
	}

	@Transactional
	public void removeFavorite(UUID annonceId, UUID buyerId) {
		favoriteRepository.deleteByBuyerIdAndAnnonceId(buyerId, annonceId);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> findFavorites(UUID buyerId, Pageable pageable) {
		return favoriteRepository.findByBuyerId(buyerId, pageable)
				.map(fav -> AnnonceMapper.toResponse(fav.getAnnonce()));
	}

	@Transactional
	public AnnonceAlert createAlert(UUID buyerId, AnnonceAlertRequest request) {
		return annonceAlertRepository.save(
				AnnonceAlert.builder()
						.buyerId(buyerId)
						.breed(request.getBreed())
						.region(request.getRegion())
						.radiusKm(request.getRadiusKm())
						.maxPrice(request.getMaxPrice())
						.minAgeMonths(request.getMinAgeMonths())
						.active(true)
						.build()
		);
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
		List<AnnonceAlert> alerts = annonceAlertRepository.findByActiveTrue();
		long matchCount = alerts.stream().filter(a -> a.matches(annonce)).count();
		if (matchCount > 0) {
			log.info("annonce.alerts.matched annonceId={} count={}", annonce.getId(), matchCount);
		}
	}

	private Annonce findOrThrow(UUID id) {
		return annonceRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("annonce.not.found id=%s".formatted(id)));
	}

	private Annonce findOwnedOrThrow(UUID id, UUID sellerId) {
		Annonce annonce = findOrThrow(id);
		if (!annonce.getSellerId().equals(sellerId)) {
			throw new IllegalStateException("annonce.access.denied id=%s".formatted(id));
		}
		return annonce;
	}

	private Point buildPoint(Double latitude, Double longitude) {
		if (latitude == null || longitude == null) return null;
		return geometryFactory.createPoint(new Coordinate(longitude, latitude));
	}
}
