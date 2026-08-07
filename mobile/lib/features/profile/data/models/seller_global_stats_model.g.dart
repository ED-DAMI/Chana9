// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_global_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerGlobalStatsModel _$SellerGlobalStatsModelFromJson(
  Map<String, dynamic> json,
) => _SellerGlobalStatsModel(
  totalViews: (json['total_views'] as num).toInt(),
  totalFavorites: (json['total_favorites'] as num).toInt(),
  totalContacts: (json['total_contacts'] as num).toInt(),
  contactRate: (json['contact_rate'] as num).toDouble(),
  totalAnnonces: (json['total_annonces'] as num).toInt(),
  activeAnnonces: (json['active_annonces'] as num).toInt(),
  soldAnnonces: (json['sold_annonces'] as num).toInt(),
);

Map<String, dynamic> _$SellerGlobalStatsModelToJson(
  _SellerGlobalStatsModel instance,
) => <String, dynamic>{
  'total_views': instance.totalViews,
  'total_favorites': instance.totalFavorites,
  'total_contacts': instance.totalContacts,
  'contact_rate': instance.contactRate,
  'total_annonces': instance.totalAnnonces,
  'active_annonces': instance.activeAnnonces,
  'sold_annonces': instance.soldAnnonces,
};
