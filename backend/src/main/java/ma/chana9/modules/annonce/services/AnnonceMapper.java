package ma.chana9.modules.annonce.services;

import ma.chana9.modules.annonce.dto.AnnonceMediaResponse;
import ma.chana9.modules.annonce.dto.AnnonceResponse;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.entities.AnnonceMedia;
import org.locationtech.jts.geom.Point;
import org.mapstruct.*;

import java.util.List;

@Mapper(componentModel = "spring", imports = AnnonceDomainService.class)
public interface AnnonceMapper {

    @Mapping(target = "latitude",           expression = "java(getY(annonce.getLocation()))")
    @Mapping(target = "longitude",          expression = "java(getX(annonce.getLocation()))")
    @Mapping(target = "distanceKm",         ignore = true)
    @Mapping(target = "eligibleForAid",     expression = "java(AnnonceDomainService.isEligibleForAid(annonce))")
    @Mapping(target = "effectiveAgeMonths", expression = "java(AnnonceDomainService.getEffectiveAgeMonths(annonce))")
    AnnonceResponse toResponse(Annonce annonce);

    @Mapping(target = "latitude",           expression = "java(getY(annonce.getLocation()))")
    @Mapping(target = "longitude",          expression = "java(getX(annonce.getLocation()))")
    @Mapping(target = "eligibleForAid",     expression = "java(AnnonceDomainService.isEligibleForAid(annonce))")
    @Mapping(target = "effectiveAgeMonths", expression = "java(AnnonceDomainService.getEffectiveAgeMonths(annonce))")
    AnnonceResponse toResponse(Annonce annonce, @Context Double distanceKm);

    @AfterMapping
    default void applyDistance(@Context Double distanceKm,
                               @MappingTarget AnnonceResponse.AnnonceResponseBuilder target) {
        if (distanceKm != null) target.distanceKm(distanceKm);
    }

    List<AnnonceMediaResponse> toMediaResponses(List<AnnonceMedia> medias);
    AnnonceMediaResponse       toMediaResponse(AnnonceMedia media);

    default Double getY(Point p) { return p != null ? p.getY() : null; }
    default Double getX(Point p) { return p != null ? p.getX() : null; }
}