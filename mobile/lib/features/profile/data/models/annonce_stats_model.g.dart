// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceStatsModel _$AnnonceStatsModelFromJson(Map<String, dynamic> json) =>
    _AnnonceStatsModel(
      annonceId: json['annonce_id'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      price: (json['price'] as num).toDouble(),
      viewCount: (json['view_count'] as num).toInt(),
      favoritesCount: (json['favorites_count'] as num).toInt(),
      contactsCount: (json['contacts_count'] as num).toInt(),
      soldAt: json['sold_at'] == null
          ? null
          : DateTime.parse(json['sold_at'] as String),
      mainPhotoUrl: json['main_photo_url'] as String?,
    );

Map<String, dynamic> _$AnnonceStatsModelToJson(_AnnonceStatsModel instance) =>
    <String, dynamic>{
      'annonce_id': instance.annonceId,
      'title': instance.title,
      'status': instance.status,
      'price': instance.price,
      'view_count': instance.viewCount,
      'favorites_count': instance.favoritesCount,
      'contacts_count': instance.contactsCount,
      'sold_at': instance.soldAt?.toIso8601String(),
      'main_photo_url': instance.mainPhotoUrl,
    };
