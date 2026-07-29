part of 'annonce_bloc.dart';

@freezed
abstract class AnnonceEvent with _$AnnonceEvent {
  const factory AnnonceEvent.searchAnnonces({
    required AnnonceSearchRequestModel request,
    @Default(0) int page,
    @Default(20) int size,
  }) = _SearchAnnonces;

  const factory AnnonceEvent.loadAnnonceById(String id) = _LoadAnnonceById;

  const factory AnnonceEvent.loadAnnoncesBySeller({
    required String sellerId,
    @Default(0) int page,
    @Default(20) int size,
  }) = _LoadAnnoncesBySeller;

  const factory AnnonceEvent.createAnnonce(Map<String, dynamic> body) =
  _CreateAnnonce;

  const factory AnnonceEvent.createAnnonceWithMedias({
    required Map<String, dynamic> body,
    required List<String> photoPaths,
  }) = _CreateAnnonceWithMedias;

  const factory AnnonceEvent.updateAnnonce({
    required String id,
    required Map<String, dynamic> body,
  }) = _UpdateAnnonce;

  const factory AnnonceEvent.deleteAnnonce(String id) = _DeleteAnnonce;

  const factory AnnonceEvent.suspendAnnonce(String id) = _SuspendAnnonce;

  const factory AnnonceEvent.reactivateAnnonce(String id) =
  _ReactivateAnnonce;

  const factory AnnonceEvent.markAsSold(String id) = _MarkAsSold;

  const factory AnnonceEvent.activateTopLot({
    required String id,
    required int durationDays,
  }) = _ActivateTopLot;

  const factory AnnonceEvent.flagAnnonce({
    required String id,
    required Map<String, dynamic> body,
  }) = _FlagAnnonce;

  const factory AnnonceEvent.addFavorite(String id) = _AddFavorite;

  const factory AnnonceEvent.removeFavorite(String id) = _RemoveFavorite;

  const factory AnnonceEvent.loadFavorites({
    @Default(0) int page,
    @Default(20) int size,
  }) = _LoadFavorites;

  const factory AnnonceEvent.createAlert(Map<String, dynamic> body) =
  _CreateAlert;

  const factory AnnonceEvent.deleteAlert(String alertId) = _DeleteAlert;

  const factory AnnonceEvent.loadAlertsByBuyer() = _LoadAlertsByBuyer;

  const factory AnnonceEvent.uploadMedia({
    required String annonceId,
    required String filePath,
  }) = _UploadMedia;
}