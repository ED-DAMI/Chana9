import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'remove_favorite.freezed.dart';

@freezed
abstract class RemoveFavoriteParams with _$RemoveFavoriteParams {
  const factory RemoveFavoriteParams({required String id}) = _RemoveFavoriteParams;
}

class RemoveFavorite implements UseCase<Unit, RemoveFavoriteParams> {
  final AnnonceRepository repository;

  RemoveFavorite(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RemoveFavoriteParams params) {
    return repository.removeFavorite(params.id);
  }
}