package ma.chana9.modules.annonce.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ma.chana9.modules.annonce.dto.*;
import ma.chana9.modules.annonce.entities.*;
import ma.chana9.modules.annonce.repositories.*;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.config.AnnonceConstants;
import ma.chana9.shared.enums.AnimalBreed;
import ma.chana9.shared.enums.AnnonceStatus;
import org.locationtech.jts.geom.*;
import org.springframework.data.domain.*;
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
	private final AnnonceFlagRepository  annonceFlagRepository;
	private final FavoriteRepository     favoriteRepository;
	private final AnnonceAlertRepository annonceAlertRepository;
	private final AnnonceMapper          annonceMapper;
	private final GeometryFactory        geometryFactory =
			new GeometryFactory(new PrecisionModel(), SRID);
	private final UserRepository userRepository;

	@Transactional
	public AnnonceResponse create(AnnonceRequest request, UUID sellerId) {
		User seller = userRepository.findById(sellerId).get();

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
				.seller(seller)
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

	@Transactional(readOnly = true)
	public AnnonceResponse findById(UUID id) {
		return annonceMapper.toResponse(findOrThrow(id));
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

	@Transactional
	public void flag(UUID annonceId, UUID reporterId, AnnonceFlagRequest request) {
		if (annonceFlagRepository.existsByAnnonceIdAndReporterId(annonceId, reporterId)) {
			throw new IllegalStateException("annonce.flag.already.reported");
		}

		Annonce annonce = findOrThrow(annonceId);

		annonceFlagRepository.save(AnnonceFlag.builder()
				.annonce(annonce)
				.reporterId(reporterId)
				.reason(request.reason())
				.comment(request.comment())
				.status(FlagStatus.PENDING)
				.build());

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
		favoriteRepository.save(Favorite.builder()
				.buyerId(buyerId)
				.annonce(findOrThrow(annonceId))
				.build());
	}

	@Transactional
	public void removeFavorite(UUID annonceId, UUID buyerId) {
		favoriteRepository.deleteByBuyerIdAndAnnonceId(buyerId, annonceId);
	}

	@Transactional(readOnly = true)
	public Page<AnnonceResponse> findFavorites(UUID buyerId, Pageable pageable) {
		return favoriteRepository.findByBuyerId(buyerId, pageable)
				.map(fav -> annonceMapper.toResponse(fav.getAnnonce()));
	}

	@Transactional
	public AnnonceAlert createAlert(UUID buyerId, AnnonceAlertRequest request) {
		return annonceAlertRepository.save(AnnonceAlert.builder()
				.buyerId(buyerId)
				.breed(AnimalBreed.valueOf(request.breed()))
				.region(request.region())
				.radiusKm(request.radiusKm())
				.maxPrice(request.maxPrice())
				.minAgeMonths(request.minAgeMonths())
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
				.orElseThrow(() -> new IllegalArgumentException("annonce.not.found id=%s".formatted(id)));
	}

	private Annonce findOwnedOrThrow(UUID id, UUID sellerId) {
		Annonce annonce = findOrThrow(id);
		if (!annonce.getSeller().getId().equals(sellerId)) {
			throw new IllegalStateException("annonce.access.denied id=%s".formatted(id));
		}
		return annonce;
	}

	private Point buildPoint(Double latitude, Double longitude) {
		if (latitude == null || longitude == null) return null;
		return geometryFactory.createPoint(new Coordinate(longitude, latitude));
	}
}