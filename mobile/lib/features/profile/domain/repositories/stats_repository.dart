import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import '../../data/entities/annonce_stats.dart';
import '../../data/entities/revenue_period.dart';
import '../../data/entities/revenue_point.dart';
import '../../data/entities/seller_global_stats.dart';
import '../../data/entities/seller_revenue.dart';

abstract class StatsRepository {
  Future<Either<Failure, SellerGlobalStats>> getSellerGlobalStats(
      String sellerId);

  Future<Either<Failure, SellerRevenue>> getSellerRevenue(
      String sellerId, RevenuePeriod period);

  Future<Either<Failure, List<RevenuePoint>>> getRevenueTimeline(
      String sellerId, RevenuePeriod period);

  Future<Either<Failure, List<AnnonceStats>>> getAnnonceStatsBySeller(
      String sellerId);
}