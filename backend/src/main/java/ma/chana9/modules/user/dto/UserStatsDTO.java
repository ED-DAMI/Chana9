package ma.chana9.modules.user.dto;

public record UserStatsDTO(
        long totalAnnonces,
        long activeAnnonces,
        long totalSales,
        double averageRating,
        long totalReviews
) {

}