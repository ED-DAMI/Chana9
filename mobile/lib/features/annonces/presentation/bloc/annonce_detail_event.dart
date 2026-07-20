part of 'annonce_detail_bloc.dart';

@freezed
abstract class AnnonceDetailEvent with _$AnnonceDetailEvent {
  const factory AnnonceDetailEvent.load(String id) = _Load;
  const factory AnnonceDetailEvent.suspend(String id) = _Suspend;
  const factory AnnonceDetailEvent.reactivate(String id) = _Reactivate;
  const factory AnnonceDetailEvent.markAsSold(String id) = _MarkAsSold;
  const factory AnnonceDetailEvent.activateTopLot({
    required String id,
    required int durationDays,
  }) = _ActivateTopLot;
  const factory AnnonceDetailEvent.flag({
    required String id,
    required Map<String, dynamic> body,
  }) = _Flag;
  const factory AnnonceDetailEvent.addFavorite(String id) = _AddFavorite;
  const factory AnnonceDetailEvent.delete(String id) = _Delete;
  const factory AnnonceDetailEvent.update({
    required String id,
    required Map<String, dynamic> body,
  }) = _Update;
}