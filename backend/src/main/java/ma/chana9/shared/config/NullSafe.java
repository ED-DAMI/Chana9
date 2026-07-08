package ma.chana9.shared.config;

import lombok.experimental.UtilityClass;


import java.util.function.Function;

@UtilityClass
public class NullSafe {

    public static <T, R> R mapped(T value, Function<T, R> mapper) {
        return value != null ? mapper.apply(value) : null;
    }

    public static <T, R> R mappedOrDefault(T value, Function<T, R> mapper, R defaultValue) {
        return value != null ? mapper.apply(value) : defaultValue;
    }

    public static <T extends Enum<T>> String nameOf(T enumValue) {
        return enumValue != null ? enumValue.name() : null;
    }
}