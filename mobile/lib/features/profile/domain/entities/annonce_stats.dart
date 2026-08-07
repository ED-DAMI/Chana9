import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';

part 'annonce_stats.freezed.dart';

@freezed
abstract class AnnonceStats with _$AnnonceStats {
  const factory AnnonceStats({
    required String annonceId,
    required String title,
    required AnnonceStatus status,
    required double price,
    required int viewCount,
    required int favoritesCount,
    required int contactsCount,
    DateTime? soldAt,
    String? mainPhotoUrl,
  }) = _AnnonceStats;
}