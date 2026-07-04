package ma.chana9.shared.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class ApiException extends RuntimeException {

    private final String messageKey;
    private final HttpStatus status;

    public ApiException(String messageKey) {
        this(HttpStatus.BAD_REQUEST, messageKey);
    }

    public ApiException(HttpStatus status, String messageKey) {
        super(messageKey);
        this.status = status;
        this.messageKey = messageKey;
    }
}
