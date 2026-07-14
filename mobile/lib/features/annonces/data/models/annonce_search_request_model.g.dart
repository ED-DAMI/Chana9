// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_search_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceSearchRequestModel _$AnnonceSearchRequestModelFromJson(
  Map<String, dynamic> json,
) => _AnnonceSearchRequestModel(
  breed: json['breed'] as String?,
  region: json['region'] as String?,
  minPrice: (json['minPrice'] as num?)?.toDouble(),
  maxPrice: (json['maxPrice'] as num?)?.toDouble(),
  minWeight: (json['minWeight'] as num?)?.toDouble(),
  maxWeight: (json['maxWeight'] as num?)?.toDouble(),
  gender: $enumDecodeNullable(_$AnimalGenderEnumMap, json['gender']),
  minAgeMonths: (json['minAgeMonths'] as num?)?.toInt(),
  maxAgeMonths: (json['maxAgeMonths'] as num?)?.toInt(),
  deliveryAvailable: json['deliveryAvailable'] as bool?,
  priceNegotiable: json['priceNegotiable'] as bool?,
  eligibleForAid: json['eligibleForAid'] as bool?,
  topLotOnly: json['topLotOnly'] as bool?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  radiusKm: (json['radiusKm'] as num?)?.toInt(),
);

Map<String, dynamic> _$AnnonceSearchRequestModelToJson(
  _AnnonceSearchRequestModel instance,
) => <String, dynamic>{
  'breed': instance.breed,
  'region': instance.region,
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'minWeight': instance.minWeight,
  'maxWeight': instance.maxWeight,
  'gender': instance.gender,
  'minAgeMonths': instance.minAgeMonths,
  'maxAgeMonths': instance.maxAgeMonths,
  'deliveryAvailable': instance.deliveryAvailable,
  'priceNegotiable': instance.priceNegotiable,
  'eligibleForAid': instance.eligibleForAid,
  'topLotOnly': instance.topLotOnly,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radiusKm': instance.radiusKm,
};

const _$AnimalGenderEnumMap = {
  AnimalGender.male: 'MALE',
  AnimalGender.female: 'FEMALE',
};
