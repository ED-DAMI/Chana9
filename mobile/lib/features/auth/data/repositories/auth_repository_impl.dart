import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/change_password_request_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

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
        await tokenStorage.saveUser(result.user);
        await tokenStorage.saveCredentials(phone: phone, password: password);
        return result;
      });

  @override
  Future<Either<Failure, AuthResult>> register({
    required String phone,
    required String password,
    String? fullName,
    String? region,
  }) =>
      _execute(() async {
        final model = await remoteDataSource.register(
          RegisterRequestModel(
            phone: phone,
            password: password,
            fullName: fullName,
            region: region,
          ),
        );
        final result = model.toEntity();
        await tokenStorage.saveTokens(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
        );
        await tokenStorage.saveUser(result.user);
        await tokenStorage.saveCredentials(phone: phone, password: password);
        return result;
      });
  

  @override
  Future<Either<Failure, User>> getCurrentUser() =>
      _execute(() async {
        final cachedUser = await tokenStorage.getCachedUser();
        if (cachedUser != null) return cachedUser;
        throw Exception('Session expirée, veuillez vous reconnecter');
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
        await tokenStorage.saveUser(result.user);
        return result;
      });

  @override
  Future<Either<Failure, Unit>> logout() =>
      _execute(() async {
        final refreshToken = await tokenStorage.getRefreshToken();
        if (refreshToken != null) {
          await remoteDataSource.logout(refreshToken);
        }
        await tokenStorage.clearTokens();
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> revokeAll() =>
      _execute(() async {
        await remoteDataSource.revokeAll();
        await tokenStorage.clearTokens();
        return unit;
      });
  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) =>
      _execute(() async {
        await remoteDataSource.changePassword(
          ChangePasswordRequestModel(
            currentPassword: currentPassword,
            newPassword: newPassword,
          ),
        );
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> requestPasswordReset(String phone) =>
      _execute(() async {
        await remoteDataSource.requestPasswordReset(phone);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> verifyOtp(String phone, String otp) =>
      _execute(() async {
        await remoteDataSource.verifyOtp(phone, otp);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) =>
      _execute(() async {
        await remoteDataSource.resetPassword(
          phone: phone,
          otp: otp,
          newPassword: newPassword,
        );
        return unit;
      });
}