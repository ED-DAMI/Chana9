// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_alert_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceAlertRequestModel _$AnnonceAlertRequestModelFromJson(
  Map<String, dynamic> json,
) => _AnnonceAlertRequestModel(
  breed: json['breed'] as String?,
  region: json['region'] as String?,
  radiusKm: (json['radiusKm'] as num?)?.toInt(),
  maxPrice: (json['maxPrice'] as num?)?.toDouble(),
  minAgeMonths: (json['minAgeMonths'] as num?)?.toInt(),
);

Map<String, dynamic> _$AnnonceAlertRequestModelToJson(
  _AnnonceAlertRequestModel instance,
) => <String, dynamic>{
  'breed': instance.breed,
  'region': instance.region,
  'radiusKm': instance.radiusKm,
  'maxPrice': instance.maxPrice,
  'minAgeMonths': instance.minAgeMonths,
};
