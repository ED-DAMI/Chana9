// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceMediaModel _$AnnonceMediaModelFromJson(Map<String, dynamic> json) =>
    _AnnonceMediaModel(
      id: json['id'] as String,
      url: json['url'] as String,
      order: (json['order'] as num).toInt(),
      isCover: json['isCover'] as bool,
    );

Map<String, dynamic> _$AnnonceMediaModelToJson(_AnnonceMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'order': instance.order,
      'isCover': instance.isCover,
    };
