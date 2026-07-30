package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class ErrorKeys {

    public static final String DEFAULT = "error.default";

    @UtilityClass
    public static class Auth {
        public static final String INVALID_OTP                  = "error.auth.invalid-otp";
        public static final String INVALID_TOKEN                = "error.auth.invalid-token";
        public static final String TOKEN_EXPIRED                = "error.auth.token-expired";
        public static final String TOKEN_REVOKED                = "error.auth.token-revoked";
        public static final String DEVICE_FINGERPRINT_MISMATCH = "error.auth.device-fingerprint-mismatch";
        public static final String INVALID_CREDENTIALS         = "error.auth.invalid-credentials";
        public static final String PHONE_ALREADY_EXISTS        = "error.auth.phone-already-exists";
        public static final String PHONE_NOT_FOUND             = "error.auth.phone-not-found";
        public static final String ACCESS_DENIED = "error.auth.access-denied";
    }

    @UtilityClass
    public static class Annonce {
        public static final String NOT_FOUND          = "error.annonce.not-found";
        public static final String FORBIDDEN          = "error.annonce.forbidden";
        public static final String MEDIA_NOT_FOUND    = "error.annonce.media-not-found";
        public static final String MAX_MEDIAS_REACHED = "error.annonce.max-medias-reached";
    }

    @UtilityClass
    public static class Favorite {
        public static final String ALREADY_ADDED = "error.favorite.already-added";
        public static final String NOT_FOUND     = "error.favorite.not-found";
    }

    @UtilityClass
    public static class Report {
        public static final String ALREADY_REPORTED = "error.report.already-reported";
        public static final String OWN_ANNONCE      = "error.report.own-annonce";
    }

    @UtilityClass
    public static class Storage {
        public static final String UPLOAD_FAILED = "error.storage.upload-failed";
        public static final String DELETE_FAILED = "error.storage.delete-failed";
    }
}