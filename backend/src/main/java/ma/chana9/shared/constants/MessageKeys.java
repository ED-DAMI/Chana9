package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class MessageKeys {

    public static final String DEFAULT = "message.default";

    @UtilityClass
    public static class Auth {
        public static final String OTP_SENT = "message.auth.otp-sent";
        public static final String OTP_VERIFIED = "message.auth.otp-verified";
        public static final String LOGOUT_SUCCESS = "message.auth.logout-success";
        public static final String TOKENS_REVOKED = "message.auth.tokens-revoked";
    }
}
