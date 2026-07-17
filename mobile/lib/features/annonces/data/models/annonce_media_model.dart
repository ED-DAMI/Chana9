import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/annonce_media.dart';

part 'annonce_media_model.freezed.dart';
part 'annonce_media_model.g.dart';

@JsonEnum(valueField: 'value')
enum MediaFormat {
  @JsonValue('IMAGE')
  image('IMAGE'),
  @JsonValue('VIDEO')
  video('VIDEO');

  final String value;
  const MediaFormat(this.value);
}

@freezed
abstract class AnnonceMediaModel with _$AnnonceMediaModel {
  const AnnonceMediaModel._();

  const factory AnnonceMediaModel({
    required String id,
    required String url,
    @JsonKey(name: 'order') required int order,
    @JsonKey(name: 'isCover') required bool isCover,
    required MediaFormat format,
  }) = _AnnonceMediaModel;

  factory AnnonceMediaModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceMediaModelFromJson(json);

  AnnonceMedia toEntity() => AnnonceMedia(
    id: id,
    url: url,
    mediaType: format.value,
    position: order,
  );
}