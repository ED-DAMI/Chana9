import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'delete_alert.freezed.dart';

@freezed
abstract class DeleteAlertParams with _$DeleteAlertParams {
  const factory DeleteAlertParams({required String alertId}) = _DeleteAlertParams;
}

class DeleteAlert implements UseCase<Unit, DeleteAlertParams> {
  final AnnonceRepository repository;

  DeleteAlert(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteAlertParams params) {
    return repository.deleteAlert(params.alertId);
  }
}
