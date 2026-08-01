class UserStats {
  final int totalAnnonces;
  final int activeAnnonces;
  final int soldAnnonces;
  final int totalFavorites;
  final double? averageRating;

  const UserStats({
    required this.totalAnnonces,
    required this.activeAnnonces,
    required this.soldAnnonces,
    required this.totalFavorites,
    this.averageRating,
  });
}