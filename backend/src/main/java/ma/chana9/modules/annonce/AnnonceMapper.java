package ma.chana9.modules.annonce;

import lombok.experimental.UtilityClass;
import ma.chana9.modules.annonce.dto.AnnonceMediaResponse;
import ma.chana9.modules.annonce.dto.AnnonceResponse;
import ma.chana9.shared.util.NullSafe;
import org.locationtech.jts.geom.Point;

import java.util.List;

@UtilityClass
public class AnnonceMapper {

    public static AnnonceResponse toResponse(Annonce annonce) {
        return toResponse(annonce, null);
    }

    public static AnnonceResponse toResponse(Annonce annonce, Double distanceKm) {
        Point location = annonce.getLocation();
        return AnnonceResponse.builder()
                .id(annonce.getId())
                .title(annonce.getTitle())
                .description(annonce.getDescription())
                .breed(annonce.getBreed())
                .estimatedWeight(annonce.getEstimatedWeight())
                .price(annonce.getPrice())
                .priceNegotiable(annonce.getPriceNegotiable())
                .region(annonce.getRegion())
                .status(annonce.getStatus())
                .gender(annonce.getGender())
                .birthDate(annonce.getBirthDate())
                .ageMonths(annonce.getAgeMonths())
                .effectiveAgeMonths(annonce.getEffectiveAgeMonths())
                .eligibleForAid(annonce.isEligibleForAid())
                .addressLabel(annonce.getAddressLabel())
                .latitude(NullSafe.mapped(location, Point::getY))
                .longitude(NullSafe.mapped(location, Point::getX))
                .distanceKm(distanceKm)
                .deliveryAvailable(annonce.getDeliveryAvailable())
                .deliveryRadiusKm(annonce.getDeliveryRadiusKm())
                .deliveryPrice(annonce.getDeliveryPrice())
                .isTopLot(annonce.getIsTopLot())
                .topLotExpiresAt(annonce.getTopLotExpiresAt())
                .expiresAt(annonce.getExpiresAt())
                .sellerId(annonce.getSellerId())
                .medias(toMediaResponses(annonce.getMedias()))
                .createdAt(annonce.getCreatedAt())
                .updatedAt(annonce.getUpdatedAt())
                .build();
    }

    public static List<AnnonceMediaResponse> toMediaResponses(List<AnnonceMedia> medias) {
        return NullSafe.mappedOrDefault(medias, list -> list.stream()
                .map(AnnonceMapper::toMediaResponse)
                .toList(), List.of());
    }

    public static AnnonceMediaResponse toMediaResponse(AnnonceMedia media) {
        return AnnonceMediaResponse.builder()
                .id(media.getId())
                .url(media.getUrl())
                .order(media.getOrder())
                .isCover(media.getIsCover())
                .format(media.getFormat())
                .build();
    }
}
