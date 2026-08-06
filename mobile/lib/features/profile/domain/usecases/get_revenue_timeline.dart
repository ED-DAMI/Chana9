import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/usecases/usecase.dart';
import '../entities/revenue_period.dart';
import '../entities/revenue_point.dart';
import '../repositories/stats_repository.dart';

part 'get_revenue_timeline.freezed.dart';

@freezed
abstract class GetRevenueTimelineParams with _$GetRevenueTimelineParams {
  const factory GetRevenueTimelineParams({
    required String sellerId,
    required RevenuePeriod period,
  }) = _GetRevenueTimelineParams;
}

class GetRevenueTimeline
    implements UseCase<List<RevenuePoint>, GetRevenueTimelineParams> {
  final StatsRepository repository;

  GetRevenueTimeline(this.repository);

  @override
  Future<Either<Failure, List<RevenuePoint>>> call(
      GetRevenueTimelineParams params) =>
      repository.getRevenueTimeline(params.sellerId, params.period);
}