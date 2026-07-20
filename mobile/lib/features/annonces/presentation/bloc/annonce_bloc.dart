import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../../data/models/annonce_search_request_model.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/entities/annonce_media.dart';
import '../../domain/usecases/create_alert.dart';
import '../../domain/usecases/create_annonce.dart';
import '../../domain/usecases/delete_alert.dart';
import '../../domain/usecases/get_alerts_by_buyer.dart';
import '../../domain/usecases/get_annonces_by_seller.dart';
import '../../domain/usecases/get_favorites.dart';
import '../../domain/usecases/remove_favorite.dart';
import '../../domain/usecases/search_annonces.dart';
import '../../domain/usecases/upload_media.dart';

part 'annonce_bloc.freezed.dart';
part 'annonce_event.dart';
part 'annonce_state.dart';

class AnnonceBloc extends Bloc<AnnonceEvent, AnnonceState> {
  final SearchAnnonces searchAnnonces;
  final GetAnnoncesBySeller getAnnoncesBySeller;
  final CreateAnnonce createAnnonce;
  final RemoveFavorite removeFavorite;
  final GetFavorites getFavorites;
  final CreateAlert createAlert;
  final DeleteAlert deleteAlert;
  final GetAlertsByBuyer getAlertsByBuyer;
  final UploadMedia uploadMedia;

  AnnonceBloc({
    required this.searchAnnonces,
    required this.getAnnoncesBySeller,
    required this.createAnnonce,
    required this.removeFavorite,
    required this.getFavorites,
    required this.createAlert,
    required this.deleteAlert,
    required this.getAlertsByBuyer,
    required this.uploadMedia,
  }) : super(const AnnonceState.initial()) {
    on<_SearchAnnonces>(_onSearchAnnonces);
    on<_LoadAnnoncesBySeller>(_onLoadAnnoncesBySeller);
    on<_CreateAnnonce>(_onCreateAnnonce);
    on<_CreateAnnonceWithMedias>(_onCreateAnnonceWithMedias);
    on<_RemoveFavorite>(_onRemoveFavorite);
    on<_LoadFavorites>(_onLoadFavorites);
    on<_CreateAlert>(_onCreateAlert);
    on<_DeleteAlert>(_onDeleteAlert);
    on<_LoadAlertsByBuyer>(_onLoadAlertsByBuyer);
    on<_UploadMedia>(_onUploadMedia);
  }

  Future<void> _onCreateAnnonceWithMedias(
      _CreateAnnonceWithMedias event, Emitter<AnnonceState> emit) async {
    emit(const AnnonceState.loading());

    final createResult = await createAnnonce(
      CreateAnnonceParams(body: event.body),
    );

    await createResult.fold(
          (failure) async => emit(AnnonceState.failure(failure.message)),
          (annonce) async {
        if (event.photoPaths.isEmpty) {
          emit(AnnonceState.annonceCreated(annonce));
          return;
        }

        final total = event.photoPaths.length;
        for (int i = 0; i < total; i++) {
          emit(AnnonceState.uploadingMedias(current: i + 1, total: total));

          final uploadResult = await uploadMedia(
            UploadMediaParams(
              annonceId: annonce.id,
              filePath: event.photoPaths[i],
            ),
          );

          uploadResult.fold(
                (failure) => null,
                (_) => null,
          );
        }

        emit(AnnonceState.annonceCreated(annonce));
      },
    );
  }

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
    final result = await deleteAlert(DeleteAlertParams(alertId: event.alertId));
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