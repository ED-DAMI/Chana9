package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class ApiPaths {

    public static final String API_V1 = "/api/v1";

    @UtilityClass
    public static class Auth {
        public static final String BASE          = API_V1 + "/auth";
        public static final String REGISTER      = "/register";
        public static final String LOGIN         = "/login";
        public static final String FORGOT_PASSWORD = "/forgot-password";
        public static final String RESET_PASSWORD  = "/reset-password";
        public static final String REFRESH       = "/refresh";
        public static final String LOGOUT        = "/logout";
        public static final String REVOKE_ALL    = "/revoke-all";
    }

    @UtilityClass
    public static class Users {
        public static final String BASE          = API_V1 + "/users";
        public static final String STATS         = BASE + "/stats";
        public static final String PROFILE       = "/profile";
        public static final String ADMIN         = "/admin";
    }

    @UtilityClass
    public static class Audit {
        public static final String BASE          = API_V1 + "/audit";
    }

    @UtilityClass
    public static class Annonces {
        public static final String BASE          = API_V1 + "/annonces";
        public static final String MY_ANNONCES   = "/me";
        public static final String ALERTS        = "/alerts";
        public static final String ALERT_BY_ID   = "/alerts/{id}";
        public static final String FLAG          = "/{id}/flag";
        public static final String TOP_LOT       = "/{id}/top-lot";
        public static final String ADMIN         = "/admin";
    }

    @UtilityClass
    public static class Sequestres {
        public static final String BASE          = API_V1 + "/sequestres";
        public static final String ADMIN         = "/admin";
        public static final String BY_ID         = "/{id}";
    }

    @UtilityClass
    public static class Messages {
        public static final String BASE          = API_V1 + "/messages";
        public static final String CONVERSATION  = "/conversation/{userId}";
        public static final String UNREAD        = "/unread";
    }

    @UtilityClass
    public static class Avis {
        public static final String BASE          = API_V1 + "/avis";
        public static final String USER          = BASE + "/user";
        public static final String BY_ID         = "/{id}";
    }

    @UtilityClass
    public static class Notifications {
        public static final String BASE          = API_V1 + "/notifications";
        public static final String MARK_READ     = "/{id}/read";
        public static final String MARK_ALL_READ = "/read-all";
    }
}