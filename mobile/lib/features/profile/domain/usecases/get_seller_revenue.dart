import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/revenue_period.dart';
import '../entities/seller_revenue.dart';
import '../repositories/stats_repository.dart';

part 'get_seller_revenue.freezed.dart';

@freezed
abstract class GetSellerRevenueParams with _$GetSellerRevenueParams {
  const factory GetSellerRevenueParams({
    required String sellerId,
    required RevenuePeriod period,
  }) = _GetSellerRevenueParams;
}

class GetSellerRevenue
    implements UseCase<SellerRevenue, GetSellerRevenueParams> {
  final StatsRepository repository;

  GetSellerRevenue(this.repository);

  @override
  Future<Either<Failure, SellerRevenue>> call(
      GetSellerRevenueParams params) =>
      repository.getSellerRevenue(params.sellerId, params.period);
}