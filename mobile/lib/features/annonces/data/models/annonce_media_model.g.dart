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
      format:
          $enumDecodeNullable(_$MediaFormatEnumMap, json['format']) ??
          MediaFormat.image,
    );

Map<String, dynamic> _$AnnonceMediaModelToJson(_AnnonceMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'order': instance.order,
      'isCover': instance.isCover,
      'format': _$MediaFormatEnumMap[instance.format]!,
    };

const _$MediaFormatEnumMap = {
  MediaFormat.image: 'IMAGE',
  MediaFormat.video: 'VIDEO',
};
