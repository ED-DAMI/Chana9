import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_global_stats.freezed.dart';

@freezed
abstract class SellerGlobalStats with _$SellerGlobalStats {
  const factory SellerGlobalStats({
    required int totalViews,
    required int totalFavorites,
    required int totalContacts,
    required double contactRate,
    required int totalAnnonces,
    required int activeAnnonces,
    required int soldAnnonces,
  }) = _SellerGlobalStats;
}