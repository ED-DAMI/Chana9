part of 'annonce_bloc.dart';

abstract class AnnonceEvent extends Equatable {
  const AnnonceEvent();

  @override
  List<Object?> get props => [];
}

class AnnonceStarted extends AnnonceEvent {
  const AnnonceStarted();
}
