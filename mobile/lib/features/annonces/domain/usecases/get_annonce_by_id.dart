import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';

part 'get_annonce_by_id.freezed.dart';

@freezed
abstract class GetAnnonceByIdParams with _$GetAnnonceByIdParams {
  const factory GetAnnonceByIdParams({required String id}) = _GetAnnonceByIdParams;
}

class GetAnnonceById implements UseCase<Annonce, GetAnnonceByIdParams> {
  final AnnonceRepository repository;

  GetAnnonceById(this.repository);

  @override
  Future<Either<Failure, Annonce>> call(GetAnnonceByIdParams params) {
    return repository.getAnnonceById(params.id);
  }
}
