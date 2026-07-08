package ma.chana9.modules.annonce;

import jakarta.persistence.criteria.Predicate;
import lombok.experimental.UtilityClass;
import ma.chana9.modules.annonce.dto.AnnonceSearchRequest;
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

            if (request.getBreed() != null) {
                predicates.add(cb.like(
                        cb.lower(root.get(EntityFields.AnnonceFields.BREED)),
                        "%%%s%%".formatted(request.getBreed().toLowerCase())
                ));
            }

            if (request.getRegion() != null) {
                predicates.add(cb.like(
                        cb.lower(root.get(EntityFields.AnnonceFields.REGION)),
                        "%%%s%%".formatted(request.getRegion().toLowerCase())
                ));
            }

            if (request.getMinPrice() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.PRICE), request.getMinPrice()));
            }

            if (request.getMaxPrice() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.PRICE), request.getMaxPrice()));
            }

            if (request.getMinWeight() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.ESTIMATED_WEIGHT), request.getMinWeight()));
            }

            if (request.getMaxWeight() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.ESTIMATED_WEIGHT), request.getMaxWeight()));
            }

            if (request.getGender() != null) {
                predicates.add(cb.equal(root.get(EntityFields.AnnonceFields.GENDER), request.getGender()));
            }

            if (request.getMinAgeMonths() != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get(EntityFields.AnnonceFields.AGE_MONTHS), request.getMinAgeMonths()));
            }

            if (request.getMaxAgeMonths() != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get(EntityFields.AnnonceFields.AGE_MONTHS), request.getMaxAgeMonths()));
            }

            if (Boolean.TRUE.equals(request.getDeliveryAvailable())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.DELIVERY_AVAILABLE)));
            }

            if (Boolean.TRUE.equals(request.getPriceNegotiable())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.PRICE_NEGOTIABLE)));
            }

            if (Boolean.TRUE.equals(request.getTopLotOnly())) {
                predicates.add(cb.isTrue(root.get(EntityFields.AnnonceFields.IS_TOP_LOT)));
            }

            if (Boolean.TRUE.equals(request.getEligibleForAid())) {
                predicates.add(cb.lessThanOrEqualTo(
                        root.get(EntityFields.AnnonceFields.BIRTH_DATE),
                        LocalDate.now().minusMonths(AnnonceConstants.AID_MIN_AGE_MONTHS)
                ));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}
