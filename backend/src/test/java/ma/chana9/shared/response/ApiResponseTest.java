package ma.chana9.shared.response;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class ApiResponseTest {

    @Test
    void success_shouldBuildSuccessfulResponseWithMessageAndData() {
        ApiResponse<String> response = ApiResponse.success("ok", "payload");

        assertTrue(response.isSuccess());
        assertEquals("ok", response.getMessage());
        assertEquals("payload", response.getData());
    }

    @Test
    void error_shouldBuildFailedResponseWithoutData() {
        ApiResponse<String> response = ApiResponse.error("failure");

        assertFalse(response.isSuccess());
        assertEquals("failure", response.getMessage());
        assertNull(response.getData());
    }
}