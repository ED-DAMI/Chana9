import 'package:get_it/get_it.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'data/datasources/annonce_remote_datasource.dart';
import 'data/repositories/annonce_repository_impl.dart';
import 'domain/repositories/annonce_repository.dart';
import 'domain/usecases/activate_top_lot.dart';
import 'domain/usecases/add_favorite.dart';
import 'domain/usecases/create_alert.dart';
import 'domain/usecases/create_annonce.dart';
import 'domain/usecases/delete_alert.dart';
import 'domain/usecases/delete_annonce.dart';
import 'domain/usecases/flag_annonce.dart';
import 'domain/usecases/get_alerts_by_buyer.dart';
import 'domain/usecases/get_annonce_by_id.dart';
import 'domain/usecases/get_annonces_by_seller.dart';
import 'domain/usecases/get_favorites.dart';
import 'domain/usecases/mark_as_sold.dart';
import 'domain/usecases/reactivate_annonce.dart';
import 'domain/usecases/remove_favorite.dart';
import 'domain/usecases/search_annonces.dart';
import 'domain/usecases/suspend_annonce.dart';
import 'domain/usecases/update_annonce.dart';
import 'presentation/bloc/annonce_bloc.dart';

void registerAnnoncesDependencies(GetIt sl) {
  sl.registerLazySingleton<AnnonceRemoteDataSource>(
    () => AnnonceRemoteDataSourceImpl(sl<DioClient>()),
  );

  sl.registerLazySingleton<AnnonceRepository>(
    () => AnnonceRepositoryImpl(sl<AnnonceRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => CreateAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => UpdateAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => DeleteAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => GetAnnonceById(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => SearchAnnonces(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => GetAnnoncesBySeller(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => SuspendAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => ReactivateAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => MarkAsSold(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => ActivateTopLot(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => FlagAnnonce(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => AddFavorite(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => RemoveFavorite(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => GetFavorites(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => CreateAlert(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => DeleteAlert(sl<AnnonceRepository>()));
  sl.registerLazySingleton(() => GetAlertsByBuyer(sl<AnnonceRepository>()));

  sl.registerFactory(() => AnnonceBloc(
        searchAnnonces: sl(),
        getAnnonceById: sl(),
        getAnnoncesBySeller: sl(),
        createAnnonce: sl(),
        updateAnnonce: sl(),
        deleteAnnonce: sl(),
        suspendAnnonce: sl(),
        reactivateAnnonce: sl(),
        markAsSold: sl(),
        activateTopLot: sl(),
        flagAnnonce: sl(),
        addFavorite: sl(),
        removeFavorite: sl(),
        getFavorites: sl(),
        createAlert: sl(),
        deleteAlert: sl(),
        getAlertsByBuyer: sl(),
      ));
}
