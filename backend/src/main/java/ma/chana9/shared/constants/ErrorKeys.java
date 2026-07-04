package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class ErrorKeys {

    public static final String DEFAULT = "error.default";

    @UtilityClass
    public static class Auth {
        public static final String INVALID_OTP = "error.auth.invalid-otp";
    }
}
