package ma.chana9.modules.annonce.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record SellerGlobalStatsDTO(
        @JsonProperty("total_views")    long totalViews,
        @JsonProperty("total_favorites") long totalFavorites,
        @JsonProperty("total_contacts") long totalContacts,
        @JsonProperty("contact_rate")   double contactRate,
        @JsonProperty("total_annonces") int totalAnnonces,
        @JsonProperty("active_annonces") int activeAnnonces,
        @JsonProperty("sold_annonces")  int soldAnnonces
) {
    public static SellerGlobalStatsDTO of(
            long totalViews,
            long totalFavorites,
            long totalContacts,
            int totalAnnonces,
            int activeAnnonces,
            int soldAnnonces
    ) {
        double contactRate = totalViews > 0
                ? (double) totalContacts / totalViews * 100.0
                : 0.0;

        return new SellerGlobalStatsDTO(
                totalViews, totalFavorites, totalContacts,
                contactRate, totalAnnonces, activeAnnonces, soldAnnonces
        );
    }
}