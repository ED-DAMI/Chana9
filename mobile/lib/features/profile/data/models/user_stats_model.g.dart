// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsModel _$UserStatsModelFromJson(Map<String, dynamic> json) =>
    _UserStatsModel(
      totalAnnonces: (json['totalAnnonces'] as num?)?.toInt() ?? 0,
      activeAnnonces: (json['activeAnnonces'] as num?)?.toInt() ?? 0,
      soldAnnonces: (json['soldAnnonces'] as num?)?.toInt() ?? 0,
      totalFavorites: (json['totalFavorites'] as num?)?.toInt() ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserStatsModelToJson(_UserStatsModel instance) =>
    <String, dynamic>{
      'totalAnnonces': instance.totalAnnonces,
      'activeAnnonces': instance.activeAnnonces,
      'soldAnnonces': instance.soldAnnonces,
      'totalFavorites': instance.totalFavorites,
      'averageRating': instance.averageRating,
    };
