import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';

import '../repositories/auth_repository.dart';


class VerifyResetOtpParams {
  final String phone;
  final String otp;
  const VerifyResetOtpParams({required this.phone, required this.otp});
}

class VerifyResetOtp implements UseCase<Unit, VerifyResetOtpParams> {
  final AuthRepository repository;
  VerifyResetOtp(this.repository);

  @override
  Future<Either<Failure, Unit>> call(VerifyResetOtpParams params) =>
      repository.verifyOtp(params.phone, params.otp);
}