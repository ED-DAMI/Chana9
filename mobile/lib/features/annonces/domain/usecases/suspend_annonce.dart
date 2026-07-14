import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import 'package:ma_chana9_app/shared/model/paginated/paginated_response.dart';
import '../repositories/annonce_repository.dart';

part 'suspend_annonce.freezed.dart';

@freezed
abstract class SuspendAnnonceParams with _$SuspendAnnonceParams {
  const factory SuspendAnnonceParams({required String id}) = _SuspendAnnonceParams;
}

class SuspendAnnonce implements UseCase<Unit, SuspendAnnonceParams> {
  final AnnonceRepository repository;

  SuspendAnnonce(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SuspendAnnonceParams params) {
    return repository.suspendAnnonce(params.id);
  }
}
