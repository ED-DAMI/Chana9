import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/annonce_repository.dart';

part 'create_alert.freezed.dart';

@freezed
abstract class CreateAlertParams with _$CreateAlertParams {
  const factory CreateAlertParams({required Map<String, dynamic> body}) =
      _CreateAlertParams;
}

class CreateAlert implements UseCase<Unit, CreateAlertParams> {
  final AnnonceRepository repository;

  CreateAlert(this.repository);

  @override
  Future<Either<Failure, Unit>> call(CreateAlertParams params) {
    return repository.createAlert(params.body);
  }
}
