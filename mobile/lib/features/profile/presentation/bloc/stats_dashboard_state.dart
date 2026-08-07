part of 'stats_dashboard_bloc.dart';

@freezed
abstract class StatsDashboardState with _$StatsDashboardState {
  const factory StatsDashboardState.initial() = _Initial;
  const factory StatsDashboardState.loading() = _Loading;

  const factory StatsDashboardState.loaded({
    required SellerGlobalStats globalStats,
    required SellerRevenue revenue,
    required List<RevenuePoint> timeline,
    required List<AnnonceStats> annonceStats,
    required RevenuePeriod selectedPeriod,
  }) = _Loaded;

  const factory StatsDashboardState.error({
    required Failure failure,
  }) = _Error;
}