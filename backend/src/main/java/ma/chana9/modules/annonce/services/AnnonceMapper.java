package ma.chana9.modules.annonce.services;

import ma.chana9.modules.annonce.dto.AnnonceMediaResponse;
import ma.chana9.modules.annonce.dto.AnnonceResponse;
import ma.chana9.modules.annonce.dto.SellerSummaryDTO;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceMedia;
import ma.chana9.modules.user.User;
import org.locationtech.jts.geom.Point;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring")
public interface AnnonceMapper {

    @Mapping(target = "latitude",   expression = "java(getY(annonce.getLocation()))")
    @Mapping(target = "longitude",  expression = "java(getX(annonce.getLocation()))")
    @Mapping(target = "distanceKm", ignore = true)
    @Mapping(target = "isTopLot",   expression = "java(annonce.isTopLot())")
    @Mapping(target = "seller",     source = "seller")
    AnnonceResponse toResponse(Annonce annonce);

    @Mapping(target = "id",         source = "annonce.id")
    @Mapping(target = "region",     source = "annonce.region")
    @Mapping(target = "latitude",   expression = "java(getY(annonce.getLocation()))")
    @Mapping(target = "longitude",  expression = "java(getX(annonce.getLocation()))")
    @Mapping(target = "distanceKm", ignore = true)
    @Mapping(target = "isTopLot",   expression = "java(annonce.isTopLot())")
    @Mapping(target = "seller",     source = "seller")
    AnnonceResponse toResponse(Annonce annonce, SellerSummaryDTO seller);

    SellerSummaryDTO toSellerSummaryDTO(User user);

    default AnnonceResponse toResponse(Annonce annonce, Double distanceKm) {
        AnnonceResponse base = toResponse(annonce);
        return new AnnonceResponse(
                base.id(),
                base.title(),
                base.description(),
                base.breed(),
                base.gender(),
                base.ageMonths(),
                base.weightKg(),
                base.dentition(),
                base.onssaTagNumber(),
                base.price(),
                base.priceType(),
                base.priceNegotiable(),
                base.headCount(),
                base.region(),
                base.addressLabel(),
                base.latitude(),
                base.longitude(),
                distanceKm,
                base.deliveryAvailable(),
                base.deliveryPrice(),
                base.boardingAvailable(),
                base.boardingDailyPrice(),
                base.status(),
                base.isTopLot(),
                base.topLotExpiresAt(),
                base.viewsCount(),
                base.favoritesCount(),
                base.expiresAt(),
                base.seller(),
                base.medias(),
                base.createdAt(),
                base.updatedAt()
        );
    }

    List<AnnonceMediaResponse> toMediaResponses(List<AnnonceMedia> medias);

    @Mapping(target = "displayOrder", source = "displayOrder")
    AnnonceMediaResponse toMediaResponse(AnnonceMedia media);

    default Double getY(Point p) { return p != null ? p.getY() : null; }
    default Double getX(Point p) { return p != null ? p.getX() : null; }
}