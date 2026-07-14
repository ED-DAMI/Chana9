import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'core/network/dio_client.dart';
import 'core/network/dio_client_factory.dart';
import 'core/network/token_storage.dart';
import 'features/auth/auth_injection.dart';
import 'features/annonces/annonces_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ── External ──────────────────────────────────────────────────────────────
  sl.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage(),
  );

  // ── Core ──────────────────────────────────────────────────────────────────
  sl.registerLazySingleton<TokenStorage>(
        () => TokenStorage(sl<FlutterSecureStorage>()),
  );

  sl.registerLazySingleton<DioClient>(
        () => DioClientFactory.create(sl<FlutterSecureStorage>()),
  );

  // ── Features ──────────────────────────────────────────────────────────────
  registerAuthDependencies(sl);
  registerAnnoncesDependencies(sl);
}