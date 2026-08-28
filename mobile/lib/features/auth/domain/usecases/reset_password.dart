import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordParams {
  final String phone;
  final String otp;
  final String newPassword;
  const ResetPasswordParams({
    required this.phone,
    required this.otp,
    required this.newPassword,
  });
}

class ResetPassword implements UseCase<Unit, ResetPasswordParams> {
  final AuthRepository repository;
  ResetPassword(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ResetPasswordParams params) =>
      repository.resetPassword(
        phone: params.phone,
        otp: params.otp,
        newPassword: params.newPassword,
      );
}