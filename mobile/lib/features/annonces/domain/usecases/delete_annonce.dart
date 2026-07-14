import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'delete_annonce.freezed.dart';

@freezed
abstract class DeleteAnnonceParams with _$DeleteAnnonceParams {
  const factory DeleteAnnonceParams({required String id}) = _DeleteAnnonceParams;
}

class DeleteAnnonce implements UseCase<Unit, DeleteAnnonceParams> {
  final AnnonceRepository repository;

  DeleteAnnonce(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteAnnonceParams params) {
    return repository.deleteAnnonce(params.id);
  }
}
