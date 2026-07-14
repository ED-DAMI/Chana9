import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'flag_annonce.freezed.dart';

@freezed
abstract class FlagAnnonceParams with _$FlagAnnonceParams {
  const factory FlagAnnonceParams({
    required String id,
    required Map<String, dynamic> body,
  }) = _FlagAnnonceParams;
}

class FlagAnnonce implements UseCase<Unit, FlagAnnonceParams> {
  final AnnonceRepository repository;

  FlagAnnonce(this.repository);

  @override
  Future<Either<Failure, Unit>> call(FlagAnnonceParams params) {
    return repository.flagAnnonce(params.id, params.body);
  }
}
