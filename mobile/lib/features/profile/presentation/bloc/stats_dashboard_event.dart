part of 'stats_dashboard_bloc.dart';

@freezed
abstract class StatsDashboardEvent with _$StatsDashboardEvent {
  const factory StatsDashboardEvent.loadDashboard({
    required String sellerId,
  }) = _LoadDashboard;

  const factory StatsDashboardEvent.changePeriod({
    required String sellerId,
    required RevenuePeriod period,
  }) = _ChangePeriod;

  const factory StatsDashboardEvent.refreshDashboard({
    required String sellerId,
  }) = _RefreshDashboard;
}