// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceRequestModel _$AnnonceRequestModelFromJson(Map<String, dynamic> json) =>
    _AnnonceRequestModel(
      title: json['title'] as String,
      description: json['description'] as String?,
      breed: $enumDecode(_$AnimalBreedEnumMap, json['breed']),
      price: (json['price'] as num).toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool?,
      region: json['region'] as String,
      gender: $enumDecodeNullable(_$AnimalGenderEnumMap, json['gender']),
      ageMonths: (json['ageMonths'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      addressLabel: json['addressLabel'] as String?,
      deliveryAvailable: json['deliveryAvailable'] as bool?,
      deliveryPrice: (json['deliveryPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AnnonceRequestModelToJson(
  _AnnonceRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'breed': instance.breed,
  'price': instance.price,
  'priceNegotiable': instance.priceNegotiable,
  'region': instance.region,
  'gender': instance.gender,
  'ageMonths': instance.ageMonths,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'addressLabel': instance.addressLabel,
  'deliveryAvailable': instance.deliveryAvailable,
  'deliveryPrice': instance.deliveryPrice,
};

const _$AnimalBreedEnumMap = {
  AnimalBreed.sardi: 'SARDI',
  AnimalBreed.timahdite: 'TIMAHDITE',
  AnimalBreed.beniGuil: 'BENI_GUIL',
  AnimalBreed.dokkali: 'DOKKALI',
  AnimalBreed.rehami: 'REHAMI',
  AnimalBreed.boujaad: 'BOUJAAD',
  AnimalBreed.oulmesZaer: 'OULMES_ZAER',
  AnimalBreed.beniAhsen: 'BENI_AHSEN',
  AnimalBreed.daMan: 'D_MAN',
  AnimalBreed.draa: 'DRAA',
  AnimalBreed.naineDeMontagne: 'NAINE_DE_MONTAGNE',
  AnimalBreed.chevreduRiff: 'CHEVRE_DU_RIFF',
  AnimalBreed.chevreDeLaayoune: 'CHEVRE_DE_LAAYOUNE',
  AnimalBreed.blondeDAquitaine: 'BLONDE_D_AQUITAINE',
  AnimalBreed.frisonnePieNoire: 'FRISONNE_PIE_NOIRE',
  AnimalBreed.montbeliarde: 'MONTBELIARDE',
  AnimalBreed.bruneAtlas: 'BRUNE_ATLAS',
  AnimalBreed.ougda: 'OUGDA',
  AnimalBreed.dromadaireSahraouii: 'DROMADAIRE_SAHRAOUI',
  AnimalBreed.dromadaireGuelmim: 'DROMADAIRE_GUELMIM',
  AnimalBreed.barbe: 'BARBE',
  AnimalBreed.arabeBarbe: 'ARABE_BARBE',
  AnimalBreed.aneBeldi: 'ANE_BELDI',
  AnimalBreed.mulet: 'MULET',
  AnimalBreed.other: 'OTHER',
};

const _$AnimalGenderEnumMap = {
  AnimalGender.male: 'MALE',
  AnimalGender.female: 'FEMALE',
};
