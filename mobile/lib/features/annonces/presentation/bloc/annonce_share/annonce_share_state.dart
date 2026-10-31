import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/share_payload.dart';

part 'annonce_share_state.freezed.dart';

@freezed
abstract class AnnonceShareState with _$AnnonceShareState {
  const factory AnnonceShareState.initial() = _Initial;
  const factory AnnonceShareState.sharing() = _Sharing;
  const factory AnnonceShareState.shared(SharePayload payload) = _Shared;
  const factory AnnonceShareState.linkCopied(String link) = _LinkCopied;
  const factory AnnonceShareState.error(String message) = _Error;
}
