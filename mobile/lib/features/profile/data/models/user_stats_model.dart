import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_stats.dart';

part 'user_stats_model.freezed.dart';
part 'user_stats_model.g.dart';

@freezed
abstract class UserStatsModel with _$UserStatsModel {
  const UserStatsModel._();

  const factory UserStatsModel({
    @Default(0) int totalAnnonces,
    @Default(0) int activeAnnonces,
    @Default(0) int soldAnnonces,
    @Default(0) int totalFavorites,
    double? averageRating,
  }) = _UserStatsModel;

  factory UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsModelFromJson(json);

  UserStats toEntity() => UserStats(
        totalAnnonces: totalAnnonces,
        activeAnnonces: activeAnnonces,
        soldAnnonces: soldAnnonces,
        totalFavorites: totalFavorites,
        averageRating: averageRating,
      );
}
