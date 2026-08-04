import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import '../entities/auth_result.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> login({
    required String phone,
    required String password,
  });
  Future<Either<Failure, AuthResult>> register({
    required String phone,
    required String password,
    String? fullName,
    String? region,
  });
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> revokeAll();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, bool>> isAuthenticated();
  Future<Either<Failure, AuthResult>> refreshToken(String refreshToken);
}