package ma.chana9.shared.exception;

import java.util.Locale;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authorization.AuthorizationDeniedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.response.ApiResponse;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler {

    private final MessageSource messageSource;

    @ExceptionHandler(ApiException.class)
    public ResponseEntity<ApiResponse<Void>> handleApiException(ApiException exception, WebRequest request) {
        Locale locale = request.getLocale();
        log.warn("ApiException: status={} key={}", exception.getStatus(), exception.getMessageKey());
        return ResponseEntity.status(exception.getStatus())
                .body(ApiResponse.error(resolve(exception.getMessageKey(), locale)));
    }

    @ExceptionHandler(SecurityException.class)
    public ResponseEntity<ApiResponse<Void>> handleSecurityException(SecurityException exception, WebRequest request) {
        Locale locale = request.getLocale();
        log.warn("SecurityException: {}", exception.getMessage());
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body(ApiResponse.error(resolve(ErrorKeys.Auth.DEVICE_FINGERPRINT_MISMATCH, locale)));
    }

    @ExceptionHandler(AuthorizationDeniedException.class)
    public ResponseEntity<ApiResponse<Void>> handleAuthorizationDeniedException(
            AuthorizationDeniedException exception, WebRequest request) {
        Locale locale = request.getLocale();
        log.warn("AuthorizationDeniedException: {}", exception.getMessage());
        return ResponseEntity.status(HttpStatus.FORBIDDEN)
                .body(ApiResponse.error(resolve(ErrorKeys.Auth.ACCESS_DENIED, locale)));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGenericException(Exception exception, WebRequest request) {
        Locale locale = request.getLocale();
        log.error("Unexpected error", exception);
        return ResponseEntity.internalServerError()
                .body(ApiResponse.error(resolve(ErrorKeys.DEFAULT, locale)));
    }

    private String resolve(String key, Locale locale) {
        return messageSource.getMessage(key, null, locale);
    }
}