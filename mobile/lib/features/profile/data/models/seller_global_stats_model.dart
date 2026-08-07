import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seller_global_stats.dart';

part 'seller_global_stats_model.freezed.dart';
part 'seller_global_stats_model.g.dart';

@freezed
abstract class SellerGlobalStatsModel with _$SellerGlobalStatsModel {
  const SellerGlobalStatsModel._();

  const factory SellerGlobalStatsModel({
    @JsonKey(name: 'total_views') required int totalViews,
    @JsonKey(name: 'total_favorites') required int totalFavorites,
    @JsonKey(name: 'total_contacts') required int totalContacts,
    @JsonKey(name: 'contact_rate') required double contactRate,
    @JsonKey(name: 'total_annonces') required int totalAnnonces,
    @JsonKey(name: 'active_annonces') required int activeAnnonces,
    @JsonKey(name: 'sold_annonces') required int soldAnnonces,
  }) = _SellerGlobalStatsModel;

  factory SellerGlobalStatsModel.fromJson(Map<String, dynamic> json) =>
      _$SellerGlobalStatsModelFromJson(json);

  SellerGlobalStats toEntity() => SellerGlobalStats(
    totalViews: totalViews,
    totalFavorites: totalFavorites,
    totalContacts: totalContacts,
    contactRate: contactRate,
    totalAnnonces: totalAnnonces,
    activeAnnonces: activeAnnonces,
    soldAnnonces: soldAnnonces,
  );
}