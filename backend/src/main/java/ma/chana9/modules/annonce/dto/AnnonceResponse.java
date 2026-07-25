package ma.chana9.modules.annonce.dto;

import ma.chana9.shared.enums.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public record AnnonceResponse(

        UUID id,
        String title,
        String description,
        AnimalBreed breed,
        AnimalGender gender,
        Integer ageMonths,
        BigDecimal weightKg,
        AnimalDentition dentition,
        String onssaTagNumber,
        BigDecimal price,
        PriceType priceType,
        Boolean priceNegotiable,
        Integer headCount,
        String region,
        String addressLabel,
        Double latitude,
        Double longitude,
        Double distanceKm,
        Boolean deliveryAvailable,
        BigDecimal deliveryPrice,
        Boolean boardingAvailable,
        BigDecimal boardingDailyPrice,
        AnnonceStatus status,
        Boolean isTopLot,
        LocalDateTime topLotExpiresAt,
        Long viewsCount,
        Long favoritesCount,
        LocalDateTime expiresAt,
        UUID sellerId,
        List<AnnonceMediaResponse> medias,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {}
