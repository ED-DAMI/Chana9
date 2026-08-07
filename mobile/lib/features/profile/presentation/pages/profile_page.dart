import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_chana9_app/injection_container.dart';
import 'package:ma_chana9_app/shared/enums/role.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';


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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState.whenOrNull(
          authenticated: (user) => user,
        );

        if (user == null) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }

        // Dashboard stats uniquement pour les vendeurs
        if (user.role == Role.seller) {
          return BlocProvider(
            create: (_) => sl<StatsDashboardBloc>()
              ..add(StatsDashboardEvent.loadDashboard(
                  sellerId: user.id)),
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
    return BlocBuilder<StatsDashboardBloc, StatsDashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<StatsDashboardBloc>().add(
                StatsDashboardEvent.refreshDashboard(
                    sellerId: user.id),
              );
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 180,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _ProfileHeader(user: user),
                  ),
                ),

                SliverToBoxAdapter(
                  child: state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const _DashboardSkeleton(),
                    loaded: (globalStats, revenue, timeline,
                        annonceStats, selectedPeriod) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),

                          // KPIs
                          _SectionTitle(title: 'Mes performances'),
                          SellerKpiCard(stats: globalStats),

                          const SizedBox(height: 8),

                          _SectionTitle(title: 'Chiffre d\'affaires'),
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
                          _SectionTitle(title: 'Mes annonces'),
                          if (annonceStats.isEmpty)
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Center(
                                child: Text(
                                  'Aucune annonce pour le moment',
                                  style: TextStyle(
                                      color: Colors.grey.shade500),
                                ),
                              ),
                            )
                          else
                            ...annonceStats.map(
                                    (s) => AnnonceStatsCard(stats: s)),

                          const SizedBox(height: 16),


                          _ProfileMenu(user: user),
                          const SizedBox(height: 32),
                        ],
                      );
                    },
                    error: (failure) => Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              size: 48, color: Colors.red),
                          const SizedBox(height: 12),
                          Text(failure.message,
                              textAlign: TextAlign.center),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () =>
                                context.read<StatsDashboardBloc>().add(
                                  StatsDashboardEvent.loadDashboard(
                                      sellerId: user.id),
                                ),
                            child: const Text('Réessayer'),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: _ProfileHeader(user: user),
            ),
          ),
          SliverToBoxAdapter(
            child: _ProfileMenu(user: user),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;

  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.primary,
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Text(
              (user.fullName?.isNotEmpty == true
                  ? user.fullName![0]
                  : user.phone[0])
                  .toUpperCase(),
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.fullName ?? 'Utilisateur',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(user.phone,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _WhiteBadge(
                        label: user.role.name.toUpperCase()),
                    if (user.kycVerified) ...[
                      const SizedBox(width: 6),
                      const _WhiteBadge(label: 'Vérifié ✓'),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WhiteBadge extends StatelessWidget {
  final String label;

  const _WhiteBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600)),
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  final User user;

  const _ProfileMenu({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _MenuItem(
            icon: Icons.storefront_outlined,
            label: 'Mes annonces',
            onTap: () =>
                context.push('/profile/my-annonces/${user.id}'),
          ),
          _MenuItem(
            icon: Icons.favorite_border,
            label: 'Mes favoris',
            onTap: () => context.push('/profile/favorites'),
          ),
          _MenuItem(
            icon: Icons.notifications_outlined,
            label: 'Mes alertes',
            onTap: () => context.push('/profile/alerts'),
          ),
          const Divider(height: 1),
          _MenuItem(
            icon: Icons.logout,
            label: 'Déconnexion',
            color: Colors.red,
            onTap: () => _confirmLogout(context),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Déconnexion'),
        content:
        const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.logout());
            },
            child: const Text('Déconnexion',
                style: TextStyle(color: Colors.red)),
          ),
        ],
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
      trailing:
      const Icon(Icons.chevron_right, color: Colors.grey),
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

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const SellerKpiCardSkeleton(),
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