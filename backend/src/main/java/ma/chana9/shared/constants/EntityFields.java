package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class EntityFields {

    @UtilityClass
    public static class Common {
        public static final String ID = "id";
        public static final String CREATED_AT = "createdAt";
        public static final String UPDATED_AT = "updatedAt";
        public static final String STATUS = "status";
    }

    @UtilityClass
    public static class User {
        public static final String PHONE = "phone";
        public static final String FULL_NAME = "fullName";
        public static final String ROLE = "role";
        public static final String KYC_VERIFIED = "kycVerified";
    }

    @UtilityClass
    public static class AuditLog {
        public static final String USER = "user";
        public static final String ACTION = "action";
        public static final String ENTITY_TYPE = "entityType";
        public static final String ENTITY_ID = "entityId";
        public static final String CREATED_AT = "createdAt";
    }
}
