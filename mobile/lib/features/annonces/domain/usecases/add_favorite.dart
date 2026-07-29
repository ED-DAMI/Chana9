import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'add_favorite.freezed.dart';

@freezed
abstract class AddFavoriteParams with _$AddFavoriteParams {
  const factory AddFavoriteParams({required String id}) = _AddFavoriteParams;
}

class AddFavorite implements UseCase<Unit, AddFavoriteParams> {
  final AnnonceRepository repository;

  AddFavorite(this.repository);

  @override
  Future<Either<Failure, Unit>> call(AddFavoriteParams params) {
    return repository.addFavorite(params.id);
  }
}