package ma.chana9.modules.annonce.repositories;


import java.math.BigDecimal;
import java.time.LocalDate;

public interface RevenuePointProjection {
    LocalDate getDate();
    BigDecimal getRevenue();
    int getSoldCount();
}