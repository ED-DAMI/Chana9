import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../../data/models/annonce_search_request_model.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/entities/annonce_media.dart';
import '../../domain/usecases/activate_top_lot.dart';
import '../../domain/usecases/add_favorite.dart';
import '../../domain/usecases/create_alert.dart';
import '../../domain/usecases/create_annonce.dart';
import '../../domain/usecases/delete_alert.dart';
import '../../domain/usecases/delete_annonce.dart';
import '../../domain/usecases/flag_annonce.dart';
import '../../domain/usecases/get_alerts_by_buyer.dart';
import '../../domain/usecases/get_annonce_by_id.dart';
import '../../domain/usecases/get_annonces_by_seller.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/mark_as_sold.dart';
import '../../domain/usecases/reactivate_annonce.dart';
import '../../domain/usecases/remove_favorite.dart';
import '../../domain/usecases/search_annonces.dart';
import '../../domain/usecases/suspend_annonce.dart';
import '../../domain/usecases/update_annonce.dart';
import '../../domain/usecases/upload_media.dart';

part 'annonce_bloc.freezed.dart';
part 'annonce_event.dart';
part 'annonce_state.dart';

class AnnonceBloc extends Bloc<AnnonceEvent, AnnonceState> {
  final SearchAnnonces searchAnnonces;
  final GetAnnonceById getAnnonceById;
  final GetAnnoncesBySeller getAnnoncesBySeller;
  final CreateAnnonce createAnnonce;
  final UpdateAnnonce updateAnnonce;
  final DeleteAnnonce deleteAnnonce;
  final SuspendAnnonce suspendAnnonce;
  final ReactivateAnnonce reactivateAnnonce;
  final MarkAsSold markAsSold;
  final ActivateTopLot activateTopLot;
  final FlagAnnonce flagAnnonce;
  final AddFavorite addFavorite;
  final RemoveFavorite removeFavorite;
  final GetFavorites getFavorites;
  final CreateAlert createAlert;
  final DeleteAlert deleteAlert;
  final GetAlertsByBuyer getAlertsByBuyer;
  final UploadMedia uploadMedia;

  AnnonceBloc({
    required this.searchAnnonces,
    required this.getAnnonceById,
    required this.getAnnoncesBySeller,
    required this.createAnnonce,
    required this.updateAnnonce,
    required this.deleteAnnonce,
    required this.suspendAnnonce,
    required this.reactivateAnnonce,
    required this.markAsSold,
    required this.activateTopLot,
    required this.flagAnnonce,
    required this.addFavorite,
    required this.removeFavorite,
    required this.getFavorites,
    required this.createAlert,
    required this.deleteAlert,
    required this.getAlertsByBuyer,
    required this.uploadMedia,
  }) : super(const AnnonceState.initial()) {
    on<_SearchAnnonces>(_onSearchAnnonces);
    on<_LoadAnnonceById>(_onLoadAnnonceById);
    on<_LoadAnnoncesBySeller>(_onLoadAnnoncesBySeller);
    on<_CreateAnnonce>(_onCreateAnnonce);
    on<_CreateAnnonceWithMedias>(_onCreateAnnonceWithMedias);
    on<_UpdateAnnonce>(_onUpdateAnnonce);
    on<_DeleteAnnonce>(_onDeleteAnnonce);
    on<_SuspendAnnonce>(_onSuspendAnnonce);
    on<_ReactivateAnnonce>(_onReactivateAnnonce);
    on<_MarkAsSold>(_onMarkAsSold);
    on<_ActivateTopLot>(_onActivateTopLot);
    on<_FlagAnnonce>(_onFlagAnnonce);
    on<_AddFavorite>(_onAddFavorite);
    on<_RemoveFavorite>(_onRemoveFavorite);
    on<_LoadFavorites>(_onLoadFavorites);
    on<_CreateAlert>(_onCreateAlert);
    on<_DeleteAlert>(_onDeleteAlert);
    on<_LoadAlertsByBuyer>(_onLoadAlertsByBuyer);
    on<_UploadMedia>(_onUploadMedia);
  }

  // ── Création + upload photos en une seule opération ─────────────────────

  Future<void> _onCreateAnnonceWithMedias(
      _CreateAnnonceWithMedias event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());

    // Étape 1 — créer l'annonce
    final createResult = await createAnnonce(
      CreateAnnonceParams(body: event.body),
    );

    await createResult.fold(
          (failure) async => emit(AnnonceState.failure(failure.message)),
          (annonce) async {
        // Pas de photos → terminé
        if (event.photoPaths.isEmpty) {
          emit(AnnonceState.annonceCreated(annonce));
          return;
        }

        // Étape 2 — uploader les photos séquentiellement
        final total = event.photoPaths.length;
        for (int i = 0; i < total; i++) {
          emit(AnnonceState.uploadingMedias(
            current: i + 1,
            total: total,
          ));

          final uploadResult = await uploadMedia(
            UploadMediaParams(
              annonceId: annonce.id,
              filePath: event.photoPaths[i],
            ),
          );

          // Si un upload échoue, on continue les autres
          // et on log l'erreur sans bloquer
          uploadResult.fold(
                (failure) => null, // continuer même si une photo échoue
                (_) => null,
          );
        }

        // Étape 3 — émettre l'état final avec l'annonce créée
        emit(AnnonceState.annonceCreated(annonce));
      },
    );
  }

  // ── Upload photo seule ───────────────────────────────────────────────────

  Future<void> _onUploadMedia(
      _UploadMedia event, Emitter<AnnonceState> emit) async {
    final result = await uploadMedia(
      UploadMediaParams(
        annonceId: event.annonceId,
        filePath: event.filePath,
      ),
    );
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (media) => emit(AnnonceState.mediaUploaded(media)),
    );
  }

  // ── Autres handlers ──────────────────────────────────────────────────────

  Future<void> _onSearchAnnonces(
      _SearchAnnonces event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await searchAnnonces(SearchAnnoncesParams(
      request: event.request,
      page: event.page,
      size: event.size,
    ));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (data) => emit(AnnonceState.annonceListLoaded(data)),
    );
  }

  Future<void> _onLoadAnnonceById(
      _LoadAnnonceById event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (a) => emit(AnnonceState.annonceDetailLoaded(a)),
    );
  }

  Future<void> _onLoadAnnoncesBySeller(
      _LoadAnnoncesBySeller event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await getAnnoncesBySeller(GetAnnoncesBySellerParams(
      sellerId: event.sellerId,
      page: event.page,
      size: event.size,
    ));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (data) => emit(AnnonceState.annonceListLoaded(data)),
    );
  }

  Future<void> _onCreateAnnonce(
      _CreateAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await createAnnonce(CreateAnnonceParams(body: event.body));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (a) => emit(AnnonceState.annonceCreated(a)),
    );
  }

  Future<void> _onUpdateAnnonce(
      _UpdateAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await updateAnnonce(
        UpdateAnnonceParams(id: event.id, body: event.body));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (a) => emit(AnnonceState.annonceUpdated(a)),
    );
  }

  Future<void> _onDeleteAnnonce(
      _DeleteAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await deleteAnnonce(DeleteAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.annonceDeleted()),
    );
  }

  Future<void> _onSuspendAnnonce(
      _SuspendAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await suspendAnnonce(SuspendAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onReactivateAnnonce(
      _ReactivateAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result =
    await reactivateAnnonce(ReactivateAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onMarkAsSold(
      _MarkAsSold event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await markAsSold(MarkAsSoldParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onActivateTopLot(
      _ActivateTopLot event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await activateTopLot(
        ActivateTopLotParams(id: event.id, durationDays: event.durationDays));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onFlagAnnonce(
      _FlagAnnonce event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result =
    await flagAnnonce(FlagAnnonceParams(id: event.id, body: event.body));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onAddFavorite(
      _AddFavorite event, Emitter<AnnonceState> emit) async {
    final result = await addFavorite(AddFavoriteParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onRemoveFavorite(
      _RemoveFavorite event, Emitter<AnnonceState> emit) async {
    final result = await removeFavorite(RemoveFavoriteParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onLoadFavorites(
      _LoadFavorites event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await getFavorites(
        GetFavoritesParams(page: event.page, size: event.size));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (data) => emit(AnnonceState.favoritesLoaded(data)),
    );
  }

  Future<void> _onCreateAlert(
      _CreateAlert event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await createAlert(CreateAlertParams(body: event.body));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onDeleteAlert(
      _DeleteAlert event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result =
    await deleteAlert(DeleteAlertParams(alertId: event.alertId));
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (_) => emit(const AnnonceState.actionSuccess()),
    );
  }

  Future<void> _onLoadAlertsByBuyer(
      _LoadAlertsByBuyer event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());
    final result = await getAlertsByBuyer(const NoParams());
    result.fold(
          (f) => emit(AnnonceState.failure(f.message)),
          (alerts) => emit(AnnonceState.alertsLoaded(alerts)),
    );
  }
}