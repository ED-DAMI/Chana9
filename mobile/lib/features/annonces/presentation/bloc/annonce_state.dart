part of 'annonce_bloc.dart';

@freezed
abstract class AnnonceState with _$AnnonceState {
  const factory AnnonceState.initial() = _Initial;
  const factory AnnonceState.loading() = _Loading;

  const factory AnnonceState.uploadingMedias({
    required int current,
    required int total,
  }) = _UploadingMedias;

  const factory AnnonceState.annonceListLoaded(
      PaginatedResponse<Annonce> annonces) = _AnnonceListLoaded;

  const factory AnnonceState.annonceDetailLoaded(Annonce annonce) =
  _AnnonceDetailLoaded;

  const factory AnnonceState.annonceCreated(Annonce annonce) = _AnnonceCreated;

  const factory AnnonceState.annonceUpdated(Annonce annonce) = _AnnonceUpdated;

  const factory AnnonceState.annonceDeleted() = _AnnonceDeleted;

  const factory AnnonceState.actionSuccess() = _ActionSuccess;

  const factory AnnonceState.favoritesLoaded(
      PaginatedResponse<Annonce> favorites) = _FavoritesLoaded;

  const factory AnnonceState.alertsLoaded(
      List<Map<String, dynamic>> alerts) = _AlertsLoaded;

  const factory AnnonceState.mediaUploaded(AnnonceMedia media) =
  _MediaUploaded;

  const factory AnnonceState.failure(String message) = _Failure;
}