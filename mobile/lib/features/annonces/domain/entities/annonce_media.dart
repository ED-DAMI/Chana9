import 'package:freezed_annotation/freezed_annotation.dart';

part 'annonce_media.freezed.dart';

@freezed
abstract class AnnonceMedia with _$AnnonceMedia {
  const factory AnnonceMedia({
    required String id,
    required String url,
    required int position,
  }) = _AnnonceMedia;
}
