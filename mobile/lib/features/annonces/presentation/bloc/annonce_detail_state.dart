part of 'annonce_detail_bloc.dart';

@freezed
abstract class AnnonceDetailState with _$AnnonceDetailState {
  const factory AnnonceDetailState.initial() = _Initial;
  const factory AnnonceDetailState.loading() = _Loading;
  const factory AnnonceDetailState.loaded(Annonce annonce) = _Loaded;
  const factory AnnonceDetailState.actionSuccess(Annonce annonce) = _ActionSuccess;
  const factory AnnonceDetailState.deleted() = _Deleted;
  const factory AnnonceDetailState.failure(String message) = _Failure;
}