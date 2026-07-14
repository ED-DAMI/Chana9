import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../entities/annonce.dart';
import '../repositories/annonce_repository.dart';

part 'update_annonce.freezed.dart';

@freezed
abstract class UpdateAnnonceParams with _$UpdateAnnonceParams {
  const factory UpdateAnnonceParams({
    required String id,
    required Map<String, dynamic> body,
  }) = _UpdateAnnonceParams;
}

class UpdateAnnonce implements UseCase<Annonce, UpdateAnnonceParams> {
  final AnnonceRepository repository;

  UpdateAnnonce(this.repository);

  @override
  Future<Either<Failure, Annonce>> call(UpdateAnnonceParams params) {
    return repository.updateAnnonce(params.id, params.body);
  }
}
