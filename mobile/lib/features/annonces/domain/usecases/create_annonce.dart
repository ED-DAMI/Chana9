import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';

part 'create_annonce.freezed.dart';

@freezed
abstract class CreateAnnonceParams with _$CreateAnnonceParams {
  const factory CreateAnnonceParams({required Map<String, dynamic> body}) =
      _CreateAnnonceParams;
}

class CreateAnnonce implements UseCase<Annonce, CreateAnnonceParams> {
  final AnnonceRepository repository;

  CreateAnnonce(this.repository);

  @override
  Future<Either<Failure, Annonce>> call(CreateAnnonceParams params) {
    return repository.createAnnonce(params.body);
  }
}
