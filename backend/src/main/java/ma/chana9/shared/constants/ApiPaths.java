package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class ApiPaths {

    public static final String API_V1 = "/api/v1";

    @UtilityClass
    public static class Auth {
        public static final String BASE = API_V1 + "/auth";
        public static final String SEND_OTP = "/send-otp";
        public static final String VERIFY_OTP = "/verify-otp";
    }

    @UtilityClass
    public static class Users {
        public static final String BASE = API_V1 + "/users";
    }

    @UtilityClass
    public static class Annonces {
        public static final String BASE = API_V1 + "/annonces";
    }

    @UtilityClass
    public static class Sequestres {
        public static final String BASE = API_V1 + "/sequestres";
    }

    @UtilityClass
    public static class Messages {
        public static final String BASE = API_V1 + "/messages";
    }
}
