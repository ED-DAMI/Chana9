import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_chana9_app/injection_container.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';
import 'package:ma_chana9_app/shared/enums/role.dart';
import 'package:ma_chana9_app/shared/localization/locale_labels.dart';
import 'package:ma_chana9_app/shared/widgets/language_selector.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/annonce_stats.dart';
import '../../domain/entities/revenue_period.dart';
import '../../domain/entities/revenue_point.dart';
import '../../domain/entities/seller_global_stats.dart';
import '../../domain/entities/seller_revenue.dart';
import '../bloc/stats_dashboard_bloc.dart';
import '../widgets/annonce_stats_card.dart';
import '../widgets/period_selector.dart';
import '../widgets/revenue_chart.dart';
import '../widgets/revenue_summary_card.dart';
import '../widgets/seller_kpi_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final user = state.whenOrNull(
          authenticated: (user) => user,
        );

        if (user == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (user.role == Role.seller) {
          return BlocProvider(
            create: (_) => sl<StatsDashboardBloc>()
              ..add(StatsDashboardEvent.loadDashboard(sellerId: user.id)),
            child: _SellerProfileView(user: user),
          );
        }

        return _BuyerProfileView(user: user);
      },
    );
  }
}

class _SellerProfileView extends StatelessWidget {
  final User user;

  const _SellerProfileView({required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<StatsDashboardBloc, StatsDashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: Text(l10n.profile),
            actions: const [LanguageSelector()],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<StatsDashboardBloc>().add(
                StatsDashboardEvent.refreshDashboard(sellerId: user.id),
              );
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _ProfileHeader(user: user),
                ),
                SliverToBoxAdapter(
                  child: state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const _DashboardSkeleton(),
                    loaded: (globalStats, revenue, timeline, annonceStats,
                        selectedPeriod) {
                      return _SellerDashboard(
                        user: user,
                        globalStats: globalStats,
                        revenue: revenue,
                        timeline: timeline,
                        annonceStats: annonceStats,
                        selectedPeriod: selectedPeriod,
                      );
                    },
                    error: (failure) => _DashboardError(
                      message: failure.message,
                      onRetry: () =>
                          context.read<StatsDashboardBloc>().add(
                            StatsDashboardEvent.loadDashboard(
                                sellerId: user.id),
                          ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _ProfileMenu(user: user),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuyerProfileView extends StatelessWidget {
  final User user;

  const _BuyerProfileView({required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(l10n.profile),
        actions: const [LanguageSelector()],
      ),
      body: ListView(
        children: [
          _ProfileHeader(user: user),
          const SizedBox(height: 12),
          _ProfileMenu(user: user),
        ],
      ),
    );
  }
}

// ── Dashboard vendeur ─────────────────────────────────────────────────────────

class _SellerDashboard extends StatelessWidget {
  final User user;
  final SellerGlobalStats globalStats;
  final SellerRevenue revenue;
  final List<RevenuePoint> timeline;
  final List<AnnonceStats> annonceStats;
  final RevenuePeriod selectedPeriod;

  const _SellerDashboard({
    required this.user,
    required this.globalStats,
    required this.revenue,
    required this.timeline,
    required this.annonceStats,
    required this.selectedPeriod,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        // KPIs
        _SectionTitle(title: l10n.views),
        SellerKpiCard(stats: globalStats),

        const SizedBox(height: 8),

        // Résumé annonces
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: _MiniStatBox(
                  label: l10n.myAnnonces,
                  value: '${globalStats.totalAnnonces}',
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _MiniStatBox(
                  label: l10n.sold,
                  value: '${globalStats.soldAnnonces}',
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Sélecteur période + CA
        _SectionTitle(title: l10n.price),
        PeriodSelector(
          sellerId: user.id,
          selected: selectedPeriod,
        ),
        RevenueSummaryCard(revenue: revenue),
        RevenueChart(
          points: timeline,
          period: selectedPeriod,
        ),

        const SizedBox(height: 8),

        // Stats par annonce
        _SectionTitle(title: l10n.myAnnonces),
        if (annonceStats.isEmpty)
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                children: [
                  const Text('🐑', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    l10n.noMyAnnonces,
                    style: TextStyle(color: Colors.grey.shade500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          ...annonceStats.map((s) => AnnonceStatsCard(stats: s)),

        const SizedBox(height: 16),
      ],
    );
  }
}

// ── Profile Header ────────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final User user;

  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            child: Text(
              (user.fullName?.isNotEmpty == true
                  ? user.fullName![0]
                  : user.phone[0])
                  .toUpperCase(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            user.fullName ?? l10n.user,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            user.phone,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _StatusBadge(
                label: user.role.localizedLabel(context),
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              _StatusBadge(
                label: user.kycVerified
                    ? l10n.verifiedCheck
                    : l10n.notVerified,
                color: user.kycVerified ? Colors.green : Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Profile Menu ──────────────────────────────────────────────────────────────

class _ProfileMenu extends StatelessWidget {
  final User user;

  const _ProfileMenu({required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Material(
      color: Colors.white,
      child: Column(
        children: [
          _MenuItem(
            icon: Icons.storefront_outlined,
            label: l10n.myAnnonces,
            onTap: () => context.push('/profile/my-annonces/${user.id}'),
          ),
          _MenuItem(
            icon: Icons.favorite_border,
            label: l10n.myFavorites,
            onTap: () => context.push('/profile/favorites'),
          ),
          _MenuItem(
            icon: Icons.notifications_outlined,
            label: l10n.myAlerts,
            onTap: () => context.push('/profile/alerts'),
          ),
          const Divider(height: 1),
          _MenuItem(
            icon: Icons.logout,
            label: l10n.logout,
            color: Colors.red,
            onTap: () => _confirmLogout(context),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child:
            Text(l10n.logout, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// ── Widgets utilitaires ───────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _MiniStatBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MiniStatBox({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.6,
            children: List.generate(
              4,
                  (_) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          3,
              (_) => Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 6),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class _DashboardError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _DashboardError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: onRetry,
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}