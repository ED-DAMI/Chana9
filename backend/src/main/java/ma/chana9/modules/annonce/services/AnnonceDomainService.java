package ma.chana9.modules.annonce.services;

import lombok.experimental.UtilityClass;
import ma.chana9.modules.annonce.entities.Annonce;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@UtilityClass
public class AnnonceDomainService {

    public static boolean isEligibleForAid(Annonce annonce) {
        if (annonce.getBirthDate() != null) {
            return annonce.getBirthDate().isBefore(LocalDate.now().minusMonths(12));
        }
        return annonce.getAgeMonths() != null && annonce.getAgeMonths() >= 12;
    }

    public static int getEffectiveAgeMonths(Annonce annonce) {
        if (annonce.getBirthDate() != null) {
            return (int) ChronoUnit.MONTHS.between(annonce.getBirthDate(), LocalDate.now());
        }
        return annonce.getAgeMonths() != null ? annonce.getAgeMonths() : 0;
    }
}