import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

class RegisterParams {
  final String phone;
  final String password;
  final String? fullName;
  final String? region;

  const RegisterParams({
    required this.phone,
    required this.password,
    this.fullName,
    this.region,
  });
}

class Register implements UseCase<AuthResult, RegisterParams> {
  final AuthRepository repository;

  Register(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(RegisterParams params) =>
      repository.register(
        phone: params.phone,
        password: params.password,
        fullName: params.fullName,
        region: params.region,
      );
}