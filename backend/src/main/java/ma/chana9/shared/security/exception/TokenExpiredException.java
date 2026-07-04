package ma.chana9.shared.security.exception;

import org.springframework.http.HttpStatus;

import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.exception.ApiException;

public class TokenExpiredException extends ApiException {

    public TokenExpiredException() {
        super(HttpStatus.UNAUTHORIZED, ErrorKeys.Auth.TOKEN_EXPIRED);
    }
}