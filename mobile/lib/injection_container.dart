import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_chana9_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ma_chana9_app/main.dart';
import 'package:ma_chana9_app/shared/bloc/locale_bloc.dart';

import 'core/network/dio_client.dart';
import 'core/network/dio_client_factory.dart';
import 'core/network/token_storage.dart';
import 'features/auth/auth_injection.dart';
import 'features/annonces/annonces_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage(),
  );

  sl.registerLazySingleton<TokenStorage>(
        () => TokenStorage(sl<FlutterSecureStorage>()),
  );

  sl.registerLazySingleton<DioClient>(
        () => DioClientFactory.create(
      sl<FlutterSecureStorage>(),
      onUnauthorized: () {
        sl<AuthBloc>().add(const AuthEvent.logout());
        navigatorKey.currentContext?.go('/login');
      },
    ),
  );

  registerAuthDependencies(sl);
  registerAnnoncesDependencies(sl);
  sl.registerLazySingleton<LocaleBloc>(
    () => LocaleBloc(storage: sl<FlutterSecureStorage>()),
  );
}