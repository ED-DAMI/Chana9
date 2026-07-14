import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

part 'login.freezed.dart';

@freezed
abstract class LoginParams with _$LoginParams {
  const factory LoginParams({
    required String phone,
    required String password,
  }) = _LoginParams;
}

class Login implements UseCase<AuthResult, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(LoginParams params) {
    return repository.login(
      phone: params.phone,
      password: params.password,
    );
  }
}
