package ma.chana9.shared.constants;

import lombok.experimental.UtilityClass;

@UtilityClass
public class SecurityConstants {

    public static final String BEARER_PREFIX = "Bearer ";
    public static final String REQUEST_USER_ID_ATTRIBUTE = "userId";
    public static final String TOKEN_CLAIM_PHONE = "Phone";
    public static final String TOKEN_CLAIM_ROLE = "role";
    public static final String TOKEN_CLAIM_JTI = "jti";
    public static final String TOKEN_CLAIM_SUBJECT = "sub";
}