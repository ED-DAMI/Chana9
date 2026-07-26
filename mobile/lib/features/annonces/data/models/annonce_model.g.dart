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
      gender: AnimalGender.fromJson(json['gender'] as String),
      ageMonths: (json['ageMonths'] as num?)?.toInt(),
      effectiveAgeMonths: (json['effectiveAgeMonths'] as num?)?.toInt(),
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      dentition: AnimalDentition.fromJson(json['dentition'] as String?),
      onssaTagNumber: json['onssaTagNumber'] as String?,
      price: (json['price'] as num).toDouble(),
      priceType: PriceType.fromJson(json['priceType'] as String?),
      priceNegotiable: json['priceNegotiable'] as bool? ?? false,
      headCount: (json['headCount'] as num?)?.toInt(),
      region: json['region'] as String,
      addressLabel: json['addressLabel'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      deliveryAvailable: json['deliveryAvailable'] as bool? ?? false,
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
      boardingAvailable: json['boardingAvailable'] as bool? ?? false,
      boardingDailyPrice: (json['boardingDailyPrice'] as num?)?.toDouble(),
      status: $enumDecode(_$AnnonceStatusEnumMap, json['status']),
      isTopLot: json['isTopLot'] as bool? ?? false,
      topLotExpiresAt: json['topLotExpiresAt'] == null
          ? null
          : DateTime.parse(json['topLotExpiresAt'] as String),
      viewsCount: (json['viewsCount'] as num?)?.toInt(),
      favoritesCount: (json['favoritesCount'] as num?)?.toInt(),
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
      'gender': instance.gender,
      'ageMonths': instance.ageMonths,
      'effectiveAgeMonths': instance.effectiveAgeMonths,
      'weightKg': instance.weightKg,
      'dentition': _$AnimalDentitionEnumMap[instance.dentition],
      'onssaTagNumber': instance.onssaTagNumber,
      'price': instance.price,
      'priceType': _$PriceTypeEnumMap[instance.priceType],
      'priceNegotiable': instance.priceNegotiable,
      'headCount': instance.headCount,
      'region': instance.region,
      'addressLabel': instance.addressLabel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceKm': instance.distanceKm,
      'deliveryAvailable': instance.deliveryAvailable,
      'deliveryPrice': instance.deliveryPrice,
      'boardingAvailable': instance.boardingAvailable,
      'boardingDailyPrice': instance.boardingDailyPrice,
      'status': instance.status,
      'isTopLot': instance.isTopLot,
      'topLotExpiresAt': instance.topLotExpiresAt?.toIso8601String(),
      'viewsCount': instance.viewsCount,
      'favoritesCount': instance.favoritesCount,
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

const _$AnimalDentitionEnumMap = {
  AnimalDentition.milkTeeth: 'MILK_TEETH',
  AnimalDentition.twoTeeth: 'TWO_TEETH',
  AnimalDentition.fourTeeth: 'FOUR_TEETH',
  AnimalDentition.sixTeeth: 'SIX_TEETH',
  AnimalDentition.fullMouth: 'FULL_MOUTH',
};

const _$PriceTypeEnumMap = {
  PriceType.fixed: 'FIXED',
  PriceType.perHead: 'PER_HEAD',
  PriceType.perKg: 'PER_KG',
};
