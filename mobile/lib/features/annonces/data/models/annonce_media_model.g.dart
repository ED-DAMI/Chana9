// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceMediaModel _$AnnonceMediaModelFromJson(Map<String, dynamic> json) =>
    _AnnonceMediaModel(
      id: json['id'] as String,
      url: json['url'] as String,
      order: (json['displayOrder'] as num).toInt(),
      isCover: json['isCover'] as bool,
    );

Map<String, dynamic> _$AnnonceMediaModelToJson(_AnnonceMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'displayOrder': instance.order,
      'isCover': instance.isCover,
    };
