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
  'breed': _$AnimalBreedEnumMap[instance.breed]!,
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

const _$AnimalGenderEnumMap = {
  AnimalGender.male: 'MALE',
  AnimalGender.female: 'FEMALE',
};
