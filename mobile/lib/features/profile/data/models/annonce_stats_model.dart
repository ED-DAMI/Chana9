import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import '../../domain/entities/annonce_stats.dart';

part 'annonce_stats_model.freezed.dart';
part 'annonce_stats_model.g.dart';

@freezed
abstract class AnnonceStatsModel with _$AnnonceStatsModel {
  const AnnonceStatsModel._();

  const factory AnnonceStatsModel({
    @JsonKey(name: 'annonce_id') required String annonceId,
    required String title,
    required String status,
    required double price,
    @JsonKey(name: 'view_count') required int viewCount,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
    @JsonKey(name: 'contacts_count') required int contactsCount,
    @JsonKey(name: 'sold_at') DateTime? soldAt,
    @JsonKey(name: 'main_photo_url') String? mainPhotoUrl,
  }) = _AnnonceStatsModel;

  factory AnnonceStatsModel.fromJson(Map<String, dynamic> json) =>
      _$AnnonceStatsModelFromJson(json);

  AnnonceStats toEntity() => AnnonceStats(
    annonceId: annonceId,
    title: title,
    status: AnnonceStatus.values.firstWhere(
          (e) => e.name.toUpperCase() == status.toUpperCase(),
      orElse: () => AnnonceStatus.active,
    ),
    price: price,
    viewCount: viewCount,
    favoritesCount: favoritesCount,
    contactsCount: contactsCount,
    soldAt: soldAt,
    mainPhotoUrl: mainPhotoUrl,
  );
}