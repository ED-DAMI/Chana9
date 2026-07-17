// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceRequestModel _$AnnonceRequestModelFromJson(Map<String, dynamic> json) =>
    _AnnonceRequestModel(
      title: json['title'] as String,
      description: json['description'] as String?,
      breed: json['breed'] as String,
      estimatedWeight: (json['estimatedWeight'] as num?)?.toDouble(),
      price: (json['price'] as num).toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool?,
      region: json['region'] as String,
      gender: $enumDecodeNullable(_$AnimalGenderEnumMap, json['gender']),
      birthDate: json['birthDate'] as String?,
      ageMonths: (json['ageMonths'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      addressLabel: json['addressLabel'] as String?,
      deliveryAvailable: json['deliveryAvailable'] as bool?,
      deliveryRadiusKm: (json['deliveryRadiusKm'] as num?)?.toInt(),
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AnnonceRequestModelToJson(
  _AnnonceRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'breed': instance.breed,
  'estimatedWeight': instance.estimatedWeight,
  'price': instance.price,
  'priceNegotiable': instance.priceNegotiable,
  'region': instance.region,
  'gender': instance.gender,
  'birthDate': instance.birthDate,
  'ageMonths': instance.ageMonths,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'addressLabel': instance.addressLabel,
  'deliveryAvailable': instance.deliveryAvailable,
  'deliveryRadiusKm': instance.deliveryRadiusKm,
  'deliveryPrice': instance.deliveryPrice,
};

const _$AnimalGenderEnumMap = {
  AnimalGender.male: 'MALE',
  AnimalGender.female: 'FEMALE',
};
