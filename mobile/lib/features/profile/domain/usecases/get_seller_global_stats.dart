import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/seller_global_stats.dart';
import '../repositories/stats_repository.dart';

part 'get_seller_global_stats.freezed.dart';

@freezed
abstract class GetSellerGlobalStatsParams
    with _$GetSellerGlobalStatsParams {
  const factory GetSellerGlobalStatsParams({required String sellerId}) =
  _GetSellerGlobalStatsParams;
}

class GetSellerGlobalStats
    implements UseCase<SellerGlobalStats, GetSellerGlobalStatsParams> {
  final StatsRepository repository;

  GetSellerGlobalStats(this.repository);

  @override
  Future<Either<Failure, SellerGlobalStats>> call(
      GetSellerGlobalStatsParams params) =>
      repository.getSellerGlobalStats(params.sellerId);
}