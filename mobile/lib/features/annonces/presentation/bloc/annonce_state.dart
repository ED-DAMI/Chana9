part of 'annonce_bloc.dart';

abstract class AnnonceState extends Equatable {
  const AnnonceState();

  @override
  List<Object?> get props => [];
}

class AnnonceInitial extends AnnonceState {
  const AnnonceInitial();
}
