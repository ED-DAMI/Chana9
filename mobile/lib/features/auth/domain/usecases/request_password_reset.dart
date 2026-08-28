import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class RequestPasswordResetParams {
  final String phone;
  const RequestPasswordResetParams({required this.phone});
}

class RequestPasswordReset implements UseCase<Unit, RequestPasswordResetParams> {
  final AuthRepository repository;
  RequestPasswordReset(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RequestPasswordResetParams params) =>
      repository.requestPasswordReset(params.phone);
}