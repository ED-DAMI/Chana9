package ma.chana9.modules.annonce.services;

import jakarta.persistence.criteria.Predicate;
import lombok.experimental.UtilityClass;
import ma.chana9.modules.annonce.dto.AnnonceSearchRequest;
import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.shared.config.AnnonceConstants;
import ma.chana9.shared.config.EntityFields;
import ma.chana9.shared.enums.AnnonceStatus;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@UtilityClass
public class AnnonceSpecification {
    public static Specification<Annonce> from(AnnonceSearchRequest request) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(cb.equal(root.get(EntityFields.AnnonceFields.STATUS), AnnonceStatus.ACTIVE));

            if (request.breed() != null) {
                predicates.add(cb.equal(
                        root.get(EntityFields.AnnonceFields.BREED),
                        request.breed()
                ));
            }

            if (request.region() != null) {
                predicates.add(cb.like(
                        cb.lower(root.get(EntityFields.AnnonceFields.REGION)),
                        "%%%s%%".formatted(request.region().toLowerCase())
                ));
            }

            if (request.minPrice() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.PRICE), request.minPrice()));
            }

            if (request.maxPrice() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.PRICE), request.maxPrice()));
            }

            if (request.minWeightKg() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.ESTIMATED_WEIGHT), request.minWeightKg()));
            }

            if (request.maxWeightKg() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.ESTIMATED_WEIGHT), request.maxWeightKg()));
            }

            if (request.gender() != null) {
                predicates.add(cb.equal(root.get(EntityFields.AnnonceFields.GENDER), request.gender()));
            }

            if (request.minAgeMonths() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.AGE_MONTHS), request.minAgeMonths()));
            }

            if (request.maxAgeMonths() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.AGE_MONTHS), request.maxAgeMonths()));
            }

            if (Boolean.TRUE.equals(request.deliveryAvailable())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.DELIVERY_AVAILABLE)));
            }

            if (Boolean.TRUE.equals(request.priceNegotiable())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.PRICE_NEGOTIABLE)));
            }

            if (Boolean.TRUE.equals(request.topLotOnly())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.IS_TOP_LOT)));
            }

            if (Boolean.TRUE.equals(request.eligibleForAid())) {
                predicates.add(cb.lessThanOrEqualTo(
                        root.get(EntityFields.AnnonceFields.BIRTH_DATE),
                        LocalDate.now().minusMonths(AnnonceConstants.AID_MIN_AGE_MONTHS)
                ));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}