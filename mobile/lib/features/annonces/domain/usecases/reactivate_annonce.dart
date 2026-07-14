import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../repositories/annonce_repository.dart';

part 'reactivate_annonce.freezed.dart';

@freezed
abstract class ReactivateAnnonceParams with _$ReactivateAnnonceParams {
  const factory ReactivateAnnonceParams({required String id}) =
      _ReactivateAnnonceParams;
}

class ReactivateAnnonce implements UseCase<Unit, ReactivateAnnonceParams> {
  final AnnonceRepository repository;

  ReactivateAnnonce(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ReactivateAnnonceParams params) {
    return repository.reactivateAnnonce(params.id);
  }
}
