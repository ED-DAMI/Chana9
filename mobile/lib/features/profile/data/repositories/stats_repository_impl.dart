import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import '../../domain/entities/annonce_stats.dart';
import '../../domain/entities/revenue_period.dart';
import '../../domain/entities/revenue_point.dart';
import '../../domain/entities/seller_global_stats.dart';
import '../../domain/entities/seller_revenue.dart';
import '../../domain/repositories/stats_repository.dart';
import '../datasources/stats_remote_datasource.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsRemoteDataSource remoteDataSource;

  StatsRepositoryImpl({required this.remoteDataSource});

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
  Future<Either<Failure, SellerGlobalStats>> getSellerGlobalStats(
      String sellerId) =>
      _execute(() async {
        final model =
        await remoteDataSource.getSellerGlobalStats(sellerId);
        return model.toEntity();
      });

  @override
  Future<Either<Failure, SellerRevenue>> getSellerRevenue(
      String sellerId, RevenuePeriod period) =>
      _execute(() async {
        final model = await remoteDataSource.getSellerRevenue(
            sellerId, period.value);
        return model.toEntity();
      });

  @override
  Future<Either<Failure, List<RevenuePoint>>> getRevenueTimeline(
      String sellerId, RevenuePeriod period) =>
      _execute(() async {
        final models = await remoteDataSource.getRevenueTimeline(
            sellerId, period.value);
        return models.map((m) => m.toEntity()).toList();
      });

  @override
  Future<Either<Failure, List<AnnonceStats>>> getAnnonceStatsBySeller(
      String sellerId) =>
      _execute(() async {
        final models =
        await remoteDataSource.getAnnonceStatsBySeller(sellerId);
        return models.map((m) => m.toEntity()).toList();
      });
}