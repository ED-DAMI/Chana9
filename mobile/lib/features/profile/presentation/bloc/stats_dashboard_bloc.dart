import 'package:dartz/dartz.dart';
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

  Future<void> _onLoadDashboard(
      _LoadDashboard event, Emitter<StatsDashboardState> emit) async {
    emit(const StatsDashboardState.loading());
    await _loadAll(event.sellerId, RevenuePeriod.month, emit);
  }

  Future<void> _onChangePeriod(
      _ChangePeriod event, Emitter<StatsDashboardState> emit) async {
    final current = state;
    if (current is! _Loaded) return;


    emit(StatsDashboardState.loaded(
      globalStats: current.globalStats,
      revenue: current.revenue,
      timeline: current.timeline,
      annonceStats: current.annonceStats,
      selectedPeriod: event.period,
    ));

    final revenueResult = await getSellerRevenue(
      GetSellerRevenueParams(
        sellerId: event.sellerId,
        period: event.period,
      ),
    );

    final timelineResult = await getRevenueTimeline(
      GetRevenueTimelineParams(
        sellerId: event.sellerId,
        period: event.period,
      ),
    );


    final revenueFailure = revenueResult.fold((f) => f, (_) => null);
    if (revenueFailure != null) {
      emit(StatsDashboardState.error(failure: revenueFailure));
      return;
    }

    final timelineFailure = timelineResult.fold((f) => f, (_) => null);
    if (timelineFailure != null) {
      emit(StatsDashboardState.error(failure: timelineFailure));
      return;
    }

    final newRevenue = revenueResult.fold(
          (_) => current.revenue,
          (revenue) => revenue,
    );

    final newTimeline = timelineResult.fold(
          (_) => current.timeline,
          (timeline) => timeline,
    );

    emit(StatsDashboardState.loaded(
      globalStats: current.globalStats,
      revenue: newRevenue,
      timeline: newTimeline,
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

  Future<void> _loadAll(
      String sellerId,
      RevenuePeriod period,
      Emitter<StatsDashboardState> emit,
      ) async {
    final Either<Failure, SellerGlobalStats> statsResult =
    await getSellerGlobalStats(
        GetSellerGlobalStatsParams(sellerId: sellerId));

    final Either<Failure, SellerRevenue> revenueResult =
    await getSellerRevenue(
        GetSellerRevenueParams(sellerId: sellerId, period: period));

    final Either<Failure, List<RevenuePoint>> timelineResult =
    await getRevenueTimeline(
        GetRevenueTimelineParams(sellerId: sellerId, period: period));

    final Either<Failure, List<AnnonceStats>> annonceResult =
    await getAnnonceStatsBySeller(
        GetAnnonceStatsBySellerParams(sellerId: sellerId));

    final statsFailure = statsResult.fold((f) => f, (_) => null);
    if (statsFailure != null) {
      emit(StatsDashboardState.error(failure: statsFailure));
      return;
    }

    final revenueFailure = revenueResult.fold((f) => f, (_) => null);
    if (revenueFailure != null) {
      emit(StatsDashboardState.error(failure: revenueFailure));
      return;
    }

    final timelineFailure = timelineResult.fold((f) => f, (_) => null);
    if (timelineFailure != null) {
      emit(StatsDashboardState.error(failure: timelineFailure));
      return;
    }

    final annonceFailure = annonceResult.fold((f) => f, (_) => null);
    if (annonceFailure != null) {
      emit(StatsDashboardState.error(failure: annonceFailure));
      return;
    }

    final globalStats = statsResult.fold((_) => null, (v) => v)!;
    final revenue = revenueResult.fold((_) => null, (v) => v)!;
    final timeline = timelineResult.fold((_) => <RevenuePoint>[], (v) => v);
    final annonceStats = annonceResult.fold((_) => <AnnonceStats>[], (v) => v);

    emit(StatsDashboardState.loaded(
      globalStats: globalStats,
      revenue: revenue,
      timeline: timeline,
      annonceStats: annonceStats,
      selectedPeriod: period,
    ));
  }
}