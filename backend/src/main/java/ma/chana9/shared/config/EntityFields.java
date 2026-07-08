package ma.chana9.shared.config;

import lombok.experimental.UtilityClass;

@UtilityClass
public class EntityFields {

    @UtilityClass
    public class Common {
        public static final String ID = "id";
        public static final String CREATED_AT = "createdAt";
        public static final String UPDATED_AT = "updatedAt";
        public static final String STATUS = "status";
        public static final String IS_ACTIVE = "active";
    }

    @UtilityClass
    public class AnnonceFields {
        public static final String TITLE = "title";
        public static final String BREED = "breed";
        public static final String PRICE = "price";
        public static final String PRICE_NEGOTIABLE = "priceNegotiable";
        public static final String REGION = "region";
        public static final String STATUS = "status";
        public static final String GENDER = "gender";
        public static final String BIRTH_DATE = "birthDate";
        public static final String AGE_MONTHS = "ageMonths";
        public static final String LOCATION = "location";
        public static final String ADDRESS_LABEL = "addressLabel";
        public static final String ESTIMATED_WEIGHT = "estimatedWeight";
        public static final String DELIVERY_AVAILABLE = "deliveryAvailable";
        public static final String DELIVERY_RADIUS_KM = "deliveryRadiusKm";
        public static final String DELIVERY_PRICE = "deliveryPrice";
        public static final String IS_TOP_LOT = "isTopLot";
        public static final String TOP_LOT_EXPIRES_AT = "topLotExpiresAt";
        public static final String EXPIRES_AT = "expiresAt";
        public static final String SELLER_ID = "sellerId";
    }

    @UtilityClass
    public class AnnonceMediaFields {
        public static final String ANNONCE = "annonce";
        public static final String URL = "url";
        public static final String ORDER = "order";
        public static final String IS_COVER = "isCover";
        public static final String FORMAT = "format";
    }

    @UtilityClass
    public class AnnonceFlagFields {
        public static final String ANNONCE = "annonce";
        public static final String REPORTER_ID = "reporterId";
        public static final String REASON = "reason";
        public static final String STATUS = "status";
        public static final String PROCESSED_AT = "processedAt";
        public static final String PROCESSED_BY = "processedBy";
    }

    @UtilityClass
    public class FavoriteFields {
        public static final String BUYER_ID = "buyerId";
        public static final String ANNONCE = "annonce";
    }

    @UtilityClass
    public class AnnonceAlertFields {
        public static final String BUYER_ID = "buyerId";
        public static final String BREED = "breed";
        public static final String REGION = "region";
        public static final String RADIUS_KM = "radiusKm";
        public static final String MAX_PRICE = "maxPrice";
        public static final String MIN_AGE_MONTHS = "minAgeMonths";
        public static final String ACTIVE = "active";
    }
}