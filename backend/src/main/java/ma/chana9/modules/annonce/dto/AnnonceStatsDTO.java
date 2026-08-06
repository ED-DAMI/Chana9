package ma.chana9.modules.annonce.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import ma.chana9.shared.enums.AnnonceStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record AnnonceStatsDTO(
        @JsonProperty("annonce_id")      String annonceId,
        String title,
        AnnonceStatus status,
        BigDecimal price,
        @JsonProperty("view_count")      long viewCount,
        @JsonProperty("favorites_count") long favoritesCount,
        @JsonProperty("contacts_count")  long contactsCount,
        @JsonProperty("sold_at")         LocalDateTime soldAt,
        @JsonProperty("main_photo_url")  String mainPhotoUrl
) {}
