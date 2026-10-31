import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/annonce.dart';

part 'annonce_share_event.freezed.dart';

@freezed
abstract class AnnonceShareEvent with _$AnnonceShareEvent {
  const factory AnnonceShareEvent.shareRequested(Annonce annonce) =
      ShareRequested;
  const factory AnnonceShareEvent.copyLinkRequested(String id) =
      CopyLinkRequested;
}
