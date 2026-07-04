package ma.chana9.shared.exception;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.response.ApiResponse;

@RestControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler {

    private final MessageSource messageSource;

    @ExceptionHandler(ApiException.class)
    public ResponseEntity<ApiResponse<Void>> handleApiException(ApiException exception, WebRequest request) {
        Locale locale = request.getLocale();
        return ResponseEntity.status(exception.getStatus())
                .body(ApiResponse.error(resolve(exception.getMessageKey(), locale)));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGenericException(Exception exception, WebRequest request) {
        Locale locale = request.getLocale();
        return ResponseEntity.internalServerError()
                .body(ApiResponse.error(resolve(ErrorKeys.DEFAULT, locale)));
    }

    private String resolve(String key, Locale locale) {
        return messageSource.getMessage(key, null, locale);
    }
}
