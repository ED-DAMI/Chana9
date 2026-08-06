package ma.chana9.modules.annonce.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.math.BigDecimal;
import java.time.LocalDate;

public record SellerRevenueDTO(
        String period,
        @JsonProperty("total_revenue")  BigDecimal totalRevenue,
        String currency,
        @JsonProperty("sold_count")     int soldCount,
        @JsonProperty("average_price")  BigDecimal averagePrice,
        @JsonProperty("start_date")     LocalDate startDate,
        @JsonProperty("end_date")       LocalDate endDate
) {
    public SellerRevenueDTO {
        if (currency == null) currency = "MAD";
    }
}