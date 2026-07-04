import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'annonce_event.dart';
part 'annonce_state.dart';

class AnnonceBloc extends Bloc<AnnonceEvent, AnnonceState> {
  AnnonceBloc() : super(const AnnonceInitial()) {
    on<AnnonceStarted>((event, emit) => emit(const AnnonceInitial()));
  }
}
