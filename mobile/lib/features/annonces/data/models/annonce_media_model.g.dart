// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annonce_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnonceMediaModel _$AnnonceMediaModelFromJson(Map<String, dynamic> json) =>
    _AnnonceMediaModel(
      id: json['id'] as String,
      url: json['url'] as String,
      mediaType: json['mediaType'] as String,
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$AnnonceMediaModelToJson(_AnnonceMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mediaType': instance.mediaType,
      'position': instance.position,
    };
