package ma.chana9.modules.annonce.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;
import java.time.LocalDate;

public record RevenuePointDTO(
        LocalDate date,
        BigDecimal revenue,
        @JsonProperty("sold_count") int soldCount
) {}
