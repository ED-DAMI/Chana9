import 'package:get_it/get_it.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import 'data/datasources/stats_remote_datasource.dart';
import 'data/repositories/stats_repository_impl.dart';
import 'domain/repositories/stats_repository.dart';
import 'domain/usecases/get_annonce_stats_by_seller.dart';
import 'domain/usecases/get_revenue_timeline.dart';
import 'domain/usecases/get_seller_global_stats.dart';
import 'domain/usecases/get_seller_revenue.dart';
import 'presentation/bloc/stats_dashboard_bloc.dart';

void registerProfileDependencies(GetIt sl) {
  sl.registerLazySingleton<StatsRemoteDataSource>(
        () => StatsRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<StatsRepository>(
        () => StatsRepositoryImpl(remoteDataSource: sl<StatsRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetSellerGlobalStats(sl<StatsRepository>()));
  sl.registerLazySingleton(() => GetSellerRevenue(sl<StatsRepository>()));
  sl.registerLazySingleton(() => GetRevenueTimeline(sl<StatsRepository>()));
  sl.registerLazySingleton(
          () => GetAnnonceStatsBySeller(sl<StatsRepository>()));

  sl.registerFactory(() => StatsDashboardBloc(
    getSellerGlobalStats: sl(),
    getSellerRevenue: sl(),
    getRevenueTimeline: sl(),
    getAnnonceStatsBySeller: sl(),
  ));
}