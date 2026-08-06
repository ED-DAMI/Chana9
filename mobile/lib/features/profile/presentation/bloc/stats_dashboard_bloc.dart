import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import '../../domain/entities/annonce_stats.dart';
import '../../domain/entities/revenue_period.dart';
import '../../domain/entities/revenue_point.dart';
import '../../domain/entities/seller_global_stats.dart';
import '../../domain/entities/seller_revenue.dart';
import '../../domain/usecases/get_annonce_stats_by_seller.dart';
import '../../domain/usecases/get_revenue_timeline.dart';
import '../../domain/usecases/get_seller_global_stats.dart';
import '../../domain/usecases/get_seller_revenue.dart';

part 'stats_dashboard_bloc.freezed.dart';
part 'stats_dashboard_event.dart';
part 'stats_dashboard_state.dart';

class StatsDashboardBloc
    extends Bloc<StatsDashboardEvent, StatsDashboardState> {
  final GetSellerGlobalStats getSellerGlobalStats;
  final GetSellerRevenue getSellerRevenue;
  final GetRevenueTimeline getRevenueTimeline;
  final GetAnnonceStatsBySeller getAnnonceStatsBySeller;

  StatsDashboardBloc({
    required this.getSellerGlobalStats,
    required this.getSellerRevenue,
    required this.getRevenueTimeline,
    required this.getAnnonceStatsBySeller,
  }) : super(const StatsDashboardState.initial()) {
    on<_LoadDashboard>(_onLoadDashboard);
    on<_ChangePeriod>(_onChangePeriod);
    on<_RefreshDashboard>(_onRefreshDashboard);
  }

  // Charge les 4 sources en parallèle
  Future<void> _onLoadDashboard(
      _LoadDashboard event, Emitter<StatsDashboardState> emit) async {
    emit(const StatsDashboardState.loading());
    await _loadAll(event.sellerId, RevenuePeriod.month, emit);
  }

  // Recharge uniquement revenue + timeline pour la nouvelle période
  Future<void> _onChangePeriod(
      _ChangePeriod event, Emitter<StatsDashboardState> emit) async {
    final current = state;
    if (current is! _Loaded) return;

    // On émet un loaded avec les anciennes données pendant le rechargement
    emit(StatsDashboardState.loaded(
      globalStats: current.globalStats,
      revenue: current.revenue,
      timeline: current.timeline,
      annonceStats: current.annonceStats,
      selectedPeriod: event.period,
    ));

    final results = await Future.wait([
      getSellerRevenue(GetSellerRevenueParams(
          sellerId: event.sellerId, period: event.period)),
      getRevenueTimeline(GetRevenueTimelineParams(
          sellerId: event.sellerId, period: event.period)),
    ]);

    final revenueResult = results[0];
    final timelineResult = results[1];

    if (revenueResult.isLeft() || timelineResult.isLeft()) {
      final failure = revenueResult.fold((f) => f, (_) => null) ??
          timelineResult.fold((f) => f, (_) => null)!;
      emit(StatsDashboardState.error(failure: failure));
      return;
    }

    emit(StatsDashboardState.loaded(
      globalStats: current.globalStats,
      revenue: revenueResult.getOrElse(() => current.revenue),
      timeline: timelineResult.fold((_) => current.timeline, (t) => t as List<RevenuePoint>),
      annonceStats: current.annonceStats,
      selectedPeriod: event.period,
    ));
  }

  Future<void> _onRefreshDashboard(
      _RefreshDashboard event, Emitter<StatsDashboardState> emit) async {
    final period = state.maybeWhen(
      loaded: (_, __, ___, ____, p) => p,
      orElse: () => RevenuePeriod.month,
    );
    await _loadAll(event.sellerId, period, emit);
  }

  // Charge les 4 sources en parallèle
  Future<void> _loadAll(String sellerId, RevenuePeriod period,
      Emitter<StatsDashboardState> emit) async {
    final results = await Future.wait([
      getSellerGlobalStats(
          GetSellerGlobalStatsParams(sellerId: sellerId)),
      getSellerRevenue(
          GetSellerRevenueParams(sellerId: sellerId, period: period)),
      getRevenueTimeline(
          GetRevenueTimelineParams(sellerId: sellerId, period: period)),
      getAnnonceStatsBySeller(
          GetAnnonceStatsBySellerParams(sellerId: sellerId)),
    ]);

    final statsResult = results[0];
    final revenueResult = results[1];
    final timelineResult = results[2];
    final annonceStatsResult = results[3];

    // Si l'une des requêtes échoue, on émet une erreur
    for (final result in results) {
      final failure = result.fold((f) => f, (_) => null);
      if (failure != null) {
        emit(StatsDashboardState.error(failure: failure as Failure));
        return;
      }
    }

    emit(StatsDashboardState.loaded(
      globalStats: statsResult.getOrElse(() => throw Exception()),
      revenue: revenueResult.getOrElse(() => throw Exception()),
      timeline: timelineResult.fold((_) => [], (t) => t as List<RevenuePoint>),
      annonceStats: annonceStatsResult.fold((_) => [], (t) => t as List<AnnonceStats>),
      selectedPeriod: period,
    ));
  }
}