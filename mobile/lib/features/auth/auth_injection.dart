import 'package:get_it/get_it.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';

import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/check_auth_status.dart';
import 'domain/usecases/get_current_user.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/logout.dart';
import 'presentation/bloc/auth_bloc.dart';


void registerAuthDependencies(GetIt sl) {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      tokenStorage: sl<TokenStorage>(),
    ),
  );

  sl.registerLazySingleton(() => Login(sl<AuthRepository>()));
  sl.registerLazySingleton(() => Logout(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUser(sl<AuthRepository>()));
  sl.registerLazySingleton(() => CheckAuthStatus(sl<AuthRepository>()));

  sl.registerFactory(() => AuthBloc(
        login: sl(),
        logout: sl(),
        getCurrentUser: sl(),
        checkAuthStatus: sl(),
      ));
}
