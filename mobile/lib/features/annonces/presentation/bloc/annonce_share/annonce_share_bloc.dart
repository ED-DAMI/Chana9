import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/core/utils/share_utils.dart';
import '../../../domain/usecases/share_annonce_usecase.dart';
import 'annonce_share_event.dart';
import 'annonce_share_state.dart';

class AnnonceShareBloc extends Bloc<AnnonceShareEvent, AnnonceShareState> {
  final ShareAnnonce shareAnnonce;

  AnnonceShareBloc({required this.shareAnnonce})
    : super(const AnnonceShareState.initial()) {
    on<ShareRequested>(_onShareRequested);
    on<CopyLinkRequested>(_onCopyLinkRequested);
  }

  Future<void> _onShareRequested(
    ShareRequested event,
    Emitter<AnnonceShareState> emit,
  ) async {
    emit(const AnnonceShareState.sharing());
    final result = await shareAnnonce(event.annonce);
    result.fold(
      (failure) => emit(AnnonceShareState.error(failure.message)),
      (payload) => emit(AnnonceShareState.shared(payload)),
    );
  }

  void _onCopyLinkRequested(
    CopyLinkRequested event,
    Emitter<AnnonceShareState> emit,
  ) {
    final id = event.id.trim();
    if (id.isEmpty) {
      emit(const AnnonceShareState.error('Identifiant d’annonce invalide'));
      return;
    }
    emit(AnnonceShareState.linkCopied(ShareUtils.buildFallbackUrl(id)));
  }
}
