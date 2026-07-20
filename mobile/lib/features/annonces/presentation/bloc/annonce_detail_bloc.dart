import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/usecases/get_annonce_by_id.dart';
import '../../domain/usecases/suspend_annonce.dart';
import '../../domain/usecases/reactivate_annonce.dart';
import '../../domain/usecases/mark_as_sold.dart';
import '../../domain/usecases/activate_top_lot.dart';
import '../../domain/usecases/flag_annonce.dart';
import '../../domain/usecases/add_favorite.dart';
import '../../domain/usecases/delete_annonce.dart';
import '../../domain/usecases/update_annonce.dart';

part 'annonce_detail_bloc.freezed.dart';
part 'annonce_detail_event.dart';
part 'annonce_detail_state.dart';

class AnnonceDetailBloc extends Bloc<AnnonceDetailEvent, AnnonceDetailState> {
  final GetAnnonceById getAnnonceById;
  final SuspendAnnonce suspendAnnonce;
  final ReactivateAnnonce reactivateAnnonce;
  final MarkAsSold markAsSold;
  final ActivateTopLot activateTopLot;
  final FlagAnnonce flagAnnonce;
  final AddFavorite addFavorite;
  final DeleteAnnonce deleteAnnonce;
  final UpdateAnnonce updateAnnonce;

  AnnonceDetailBloc({
    required this.getAnnonceById,
    required this.suspendAnnonce,
    required this.reactivateAnnonce,
    required this.markAsSold,
    required this.activateTopLot,
    required this.flagAnnonce,
    required this.addFavorite,
    required this.deleteAnnonce,
    required this.updateAnnonce,
  }) : super(const AnnonceDetailState.initial()) {
    on<_Load>(_onLoad);
    on<_Suspend>(_onSuspend);
    on<_Reactivate>(_onReactivate);
    on<_MarkAsSold>(_onMarkAsSold);
    on<_ActivateTopLot>(_onActivateTopLot);
    on<_Flag>(_onFlag);
    on<_AddFavorite>(_onAddFavorite);
    on<_Delete>(_onDelete);
    on<_Update>(_onUpdate);
  }

  Future<void> _onLoad(_Load event, Emitter<AnnonceDetailState> emit) async {
    emit(const AnnonceDetailState.loading());
    final result = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (a) => emit(AnnonceDetailState.loaded(a)),
    );
  }

  Future<void> _onSuspend(_Suspend event, Emitter<AnnonceDetailState> emit) async {
    final result = await suspendAnnonce(SuspendAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onReactivate(_Reactivate event, Emitter<AnnonceDetailState> emit) async {
    final result = await reactivateAnnonce(ReactivateAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onMarkAsSold(_MarkAsSold event, Emitter<AnnonceDetailState> emit) async {
    final result = await markAsSold(MarkAsSoldParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onActivateTopLot(_ActivateTopLot event, Emitter<AnnonceDetailState> emit) async {
    final result = await activateTopLot(
        ActivateTopLotParams(id: event.id, durationDays: event.durationDays));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onFlag(_Flag event, Emitter<AnnonceDetailState> emit) async {
    final result = await flagAnnonce(FlagAnnonceParams(id: event.id, body: event.body));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onAddFavorite(_AddFavorite event, Emitter<AnnonceDetailState> emit) async {
    final result = await addFavorite(AddFavoriteParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) async {
        final r = await getAnnonceById(GetAnnonceByIdParams(id: event.id));
        r.fold(
              (f) => emit(AnnonceDetailState.failure(f.message)),
              (a) => emit(AnnonceDetailState.actionSuccess(a)),
        );
      },
    );
  }

  Future<void> _onDelete(_Delete event, Emitter<AnnonceDetailState> emit) async {
    emit(const AnnonceDetailState.loading());
    final result = await deleteAnnonce(DeleteAnnonceParams(id: event.id));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (_) => emit(const AnnonceDetailState.deleted()),
    );
  }

  Future<void> _onUpdate(_Update event, Emitter<AnnonceDetailState> emit) async {
    emit(const AnnonceDetailState.loading());
    final result = await updateAnnonce(UpdateAnnonceParams(id: event.id, body: event.body));
    result.fold(
          (f) => emit(AnnonceDetailState.failure(f.message)),
          (a) => emit(AnnonceDetailState.loaded(a)),
    );
  }
}