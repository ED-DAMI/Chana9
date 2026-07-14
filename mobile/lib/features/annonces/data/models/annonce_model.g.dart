// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceModel _$AnnonceModelFromJson(Map<String, dynamic> json) =>
    _AnnonceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      breed: json['breed'] as String,
      estimatedWeight: (json['estimatedWeight'] as num?)?.toDouble(),
      price: (json['price'] as num).toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool,
      region: json['region'] as String,
      status: $enumDecode(_$AnnonceStatusEnumMap, json['status']),
      gender: $enumDecodeNullable(_$AnimalGenderEnumMap, json['gender']),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      ageMonths: (json['ageMonths'] as num?)?.toInt(),
      effectiveAgeMonths: (json['effectiveAgeMonths'] as num?)?.toInt(),
      eligibleForAid: json['eligibleForAid'] as bool,
      addressLabel: json['addressLabel'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      deliveryAvailable: json['deliveryAvailable'] as bool,
      deliveryRadiusKm: (json['deliveryRadiusKm'] as num?)?.toInt(),
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
      isTopLot: json['isTopLot'] as bool,
      topLotExpiresAt: json['topLotExpiresAt'] == null
          ? null
          : DateTime.parse(json['topLotExpiresAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      sellerId: json['sellerId'] as String,
      medias:
          (json['medias'] as List<dynamic>?)
              ?.map(
                (e) => AnnonceMediaModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AnnonceModelToJson(_AnnonceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'breed': instance.breed,
      'estimatedWeight': instance.estimatedWeight,
      'price': instance.price,
      'priceNegotiable': instance.priceNegotiable,
      'region': instance.region,
      'status': instance.status,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'ageMonths': instance.ageMonths,
      'effectiveAgeMonths': instance.effectiveAgeMonths,
      'eligibleForAid': instance.eligibleForAid,
      'addressLabel': instance.addressLabel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceKm': instance.distanceKm,
      'deliveryAvailable': instance.deliveryAvailable,
      'deliveryRadiusKm': instance.deliveryRadiusKm,
      'deliveryPrice': instance.deliveryPrice,
      'isTopLot': instance.isTopLot,
      'topLotExpiresAt': instance.topLotExpiresAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'sellerId': instance.sellerId,
      'medias': instance.medias,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AnnonceStatusEnumMap = {
  AnnonceStatus.draft: 'DRAFT',
  AnnonceStatus.active: 'ACTIVE',
  AnnonceStatus.suspended: 'SUSPENDED',
  AnnonceStatus.sold: 'SOLD',
  AnnonceStatus.expired: 'EXPIRED',
};

const _$AnimalGenderEnumMap = {
  AnimalGender.male: 'MALE',
  AnimalGender.female: 'FEMALE',
};
