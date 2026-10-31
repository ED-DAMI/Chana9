package ma.chana9.shared.config;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class NullSafeTest {

    @Test
    void mapped_whenValueIsPresent_shouldApplyMapper() {
        Integer result = NullSafe.mapped("chana9", String::length);

        assertEquals(6, result);
    }

    @Test
    void mapped_whenValueIsNull_shouldReturnNullWithoutCallingMapper() {
        String result = NullSafe.mapped(null, value -> value.toString());

        assertNull(result);
    }

    @Test
    void mappedOrDefault_whenValueIsNull_shouldReturnDefault() {
        String result = NullSafe.mappedOrDefault(null, value -> value.toString(), "default");

        assertEquals("default", result);
    }

    @Test
    void nameOf_whenEnumIsPresent_shouldReturnEnumName() {
        assertEquals("MONDAY", NullSafe.nameOf(java.time.DayOfWeek.MONDAY));
    }

    @Test
    void nameOf_whenEnumIsNull_shouldReturnNull() {
        assertNull(NullSafe.nameOf(null));
    }
}