import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/user_repository.dart';

class ChangePasswordParams {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });
}

class ChangePassword implements UseCase<Unit, ChangePasswordParams> {
  final UserRepository repository;

  ChangePassword(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) =>
      repository.changePassword(
        currentPassword: params.currentPassword,
        newPassword: params.newPassword,
      );
}
