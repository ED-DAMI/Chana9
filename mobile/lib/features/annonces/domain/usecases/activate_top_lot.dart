import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'activate_top_lot.freezed.dart';

@freezed
abstract class ActivateTopLotParams with _$ActivateTopLotParams {
  const factory ActivateTopLotParams({
    required String id,
    required int durationDays,
  }) = _ActivateTopLotParams;
}

class ActivateTopLot implements UseCase<Unit, ActivateTopLotParams> {
  final AnnonceRepository repository;

  ActivateTopLot(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ActivateTopLotParams params) {
    return repository.activateTopLot(params.id, params.durationDays);
  }
}
