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
      breed: $enumDecode(_$AnimalBreedEnumMap, json['breed']),
      price: (json['price'] as num).toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool?,
      region: json['region'] as String,
      status: $enumDecode(_$AnnonceStatusEnumMap, json['status']),
      gender: $enumDecodeNullable(_$AnimalGenderEnumMap, json['gender']),
      ageMonths: (json['ageMonths'] as num?)?.toInt(),
      effectiveAgeMonths: (json['effectiveAgeMonths'] as num?)?.toInt(),
      eligibleForAid: json['eligibleForAid'] as bool?,
      addressLabel: json['addressLabel'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      deliveryAvailable: json['deliveryAvailable'] as bool?,
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
      isTopLot: json['isTopLot'] as bool?,
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AnnonceModelToJson(_AnnonceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'breed': _$AnimalBreedEnumMap[instance.breed]!,
      'price': instance.price,
      'priceNegotiable': instance.priceNegotiable,
      'region': instance.region,
      'status': instance.status,
      'gender': instance.gender,
      'ageMonths': instance.ageMonths,
      'effectiveAgeMonths': instance.effectiveAgeMonths,
      'eligibleForAid': instance.eligibleForAid,
      'addressLabel': instance.addressLabel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceKm': instance.distanceKm,
      'deliveryAvailable': instance.deliveryAvailable,
      'deliveryPrice': instance.deliveryPrice,
      'isTopLot': instance.isTopLot,
      'topLotExpiresAt': instance.topLotExpiresAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'sellerId': instance.sellerId,
      'medias': instance.medias,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$AnimalBreedEnumMap = {
  AnimalBreed.sardi: 'sardi',
  AnimalBreed.timahdite: 'timahdite',
  AnimalBreed.beniGuil: 'beniGuil',
  AnimalBreed.dokkali: 'dokkali',
  AnimalBreed.rehami: 'rehami',
  AnimalBreed.boujaad: 'boujaad',
  AnimalBreed.oulmesZaer: 'oulmesZaer',
  AnimalBreed.beniAhsen: 'beniAhsen',
  AnimalBreed.daMan: 'daMan',
  AnimalBreed.draa: 'draa',
  AnimalBreed.naineDeMontagne: 'naineDeMontagne',
  AnimalBreed.chevreduRiff: 'chevreduRiff',
  AnimalBreed.chevreDeLaayoune: 'chevreDeLaayoune',
  AnimalBreed.blondeDAquitaine: 'blondeDAquitaine',
  AnimalBreed.frisonnePieNoire: 'frisonnePieNoire',
  AnimalBreed.montbeliarde: 'montbeliarde',
  AnimalBreed.bruneAtlas: 'bruneAtlas',
  AnimalBreed.ougda: 'ougda',
  AnimalBreed.dromadaireSahraouii: 'dromadaireSahraouii',
  AnimalBreed.dromadaireGuelmim: 'dromadaireGuelmim',
  AnimalBreed.barbe: 'barbe',
  AnimalBreed.arabeBarbe: 'arabeBarbe',
  AnimalBreed.aneBeldi: 'aneBeldi',
  AnimalBreed.mulet: 'mulet',
  AnimalBreed.other: 'other',
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
