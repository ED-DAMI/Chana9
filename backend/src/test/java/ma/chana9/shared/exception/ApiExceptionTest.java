package ma.chana9.shared.exception;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ApiExceptionTest {

    @Test
    void singleArgumentConstructor_shouldUseBadRequest() {
        ApiException exception = new ApiException("error.invalid");

        assertEquals(HttpStatus.BAD_REQUEST, exception.getStatus());
        assertEquals("error.invalid", exception.getMessageKey());
        assertEquals("error.invalid", exception.getMessage());
    }

    @Test
    void statusConstructor_shouldPreserveStatusAndMessageKey() {
        ApiException exception = new ApiException(HttpStatus.NOT_FOUND, "error.missing");

        assertEquals(HttpStatus.NOT_FOUND, exception.getStatus());
        assertEquals("error.missing", exception.getMessageKey());
    }
}