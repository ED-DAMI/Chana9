package ma.chana9.shared.i18n;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.context.i18n.LocaleContextHolder;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MessageResolver {

    private final MessageSource messageSource;

    public String resolve(String key) {
        return messageSource.getMessage(key, null, LocaleContextHolder.getLocale());
    }
}
