import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/annonce_media.dart';

part 'annonce_media_model.freezed.dart';
part 'annonce_media_model.g.dart';

@freezed
abstract class AnnonceMediaModel with _$AnnonceMediaModel {
  const AnnonceMediaModel._();

  const factory AnnonceMediaModel({
    required String id,
    required String url,
    required String mediaType,
    required int position,
  }) = _AnnonceMediaModel;

  factory AnnonceMediaModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceMediaModelFromJson(json);

  AnnonceMedia toEntity() => AnnonceMedia(
        id: id,
        url: url,
        mediaType: mediaType,
        position: position,
      );
}
