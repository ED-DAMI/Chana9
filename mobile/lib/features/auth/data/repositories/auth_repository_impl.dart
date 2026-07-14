import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorage,
  });

  Future<Either<Failure, T>> _execute<T>(Future<T> Function() call) async {
    try {
      return Right(await call());
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> login({
    required String phone,
    required String password,
  }) =>
      _execute(() async {
        final model = await remoteDataSource.login(
          LoginRequestModel(phone: phone, password: password),
        );
        final result = model.toEntity();
        await tokenStorage.saveTokens(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
        );
        return result;
      });

  @override
  Future<Either<Failure, Unit>> logout() =>
      _execute(() async {
        await tokenStorage.clearTokens();
        return unit;
      });

  @override
  Future<Either<Failure, User>> getCurrentUser() =>
      _execute(() async {
        final cachedUser = await tokenStorage.getCachedUser();
        if (cachedUser != null) return cachedUser;
        throw Exception('No cached user found');
      });

  @override
  Future<Either<Failure, bool>> isAuthenticated() =>
      _execute(() => tokenStorage.hasToken());

  @override
  Future<Either<Failure, AuthResult>> refreshToken(String refreshToken) =>
      _execute(() async {
        final model = await remoteDataSource.refreshToken(refreshToken);
        final result = model.toEntity();
        await tokenStorage.saveTokens(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
        );
        return result;
      });
}
