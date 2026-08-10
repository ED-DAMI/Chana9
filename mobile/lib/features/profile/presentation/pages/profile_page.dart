import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ma_chana9_app/injection_container.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
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
import '../widgets/revenue_chart.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final user = state.whenOrNull(authenticated: (user) => user);
        if (user == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
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
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              l10n.profile,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: const [LanguageSelector()],
          ),
          body: RefreshIndicator(
            color: const Color(0xFF2E7D32),
            onRefresh: () async {
              context.read<StatsDashboardBloc>().add(
                StatsDashboardEvent.refreshDashboard(sellerId: user.id),
              );
            },
            child: ListView(
              children: [
                _AvatarHeader(user: user),
                const SizedBox(height: 12),
                state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const _DashboardSkeleton(),
                  loaded: (globalStats, revenue, timeline, annonceStats, selectedPeriod) =>
                      _SellerAccordions(
                        user: user,
                        globalStats: globalStats,
                        revenue: revenue,
                        timeline: timeline,
                        annonceStats: annonceStats,
                        selectedPeriod: selectedPeriod,
                      ),
                  error: (failure) => _ErrorBanner(
                    message: failure.message,
                    onRetry: () => context.read<StatsDashboardBloc>().add(
                      StatsDashboardEvent.loadDashboard(sellerId: user.id),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _SettingsAccordion(user: user),
                const SizedBox(height: 16),
                _SupportButton(),
                const SizedBox(height: 8),
                _LogoutButton(),
                const SizedBox(height: 32),
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
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(l10n.profile, style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: const [LanguageSelector()],
      ),
      body: ListView(
        children: [
          _AvatarHeader(user: user),
          const SizedBox(height: 12),
          _SettingsAccordion(user: user),
          const SizedBox(height: 16),
          _SupportButton(),
          const SizedBox(height: 8),
          _LogoutButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _AvatarHeader extends StatelessWidget {
  final User user;
  const _AvatarHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final initial = (user.fullName?.isNotEmpty == true ? user.fullName![0] : user.phone[0]).toUpperCase();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: const Color(0xFF2E7D32).withOpacity(0.12),
                child: Text(
                  initial,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: user.kycVerified ? const Color(0xFF4CAF50) : const Color(0xFFFF9800),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(
                  user.kycVerified ? Icons.verified : Icons.access_time_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            user.fullName ?? l10n.user,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            user.phone,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            user.role.localizedLabel(context),
            style: const TextStyle(
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          if (!user.kycVerified)
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shield_outlined, size: 16),
              label: Text(l10n.verifiedCheck),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFFF9800),
                side: const BorderSide(color: Color(0xFFFF9800)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF4CAF50).withOpacity(0.4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.verified, size: 14, color: Color(0xFF4CAF50)),
                  const SizedBox(width: 6),
                  Text(
                    l10n.verifiedCheck,
                    style: const TextStyle(
                      color: Color(0xFF4CAF50),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SellerAccordions extends StatelessWidget {
  final User user;
  final SellerGlobalStats globalStats;
  final SellerRevenue revenue;
  final List<RevenuePoint> timeline;
  final List<AnnonceStats> annonceStats;
  final RevenuePeriod selectedPeriod;

  const _SellerAccordions({
    required this.user,
    required this.globalStats,
    required this.revenue,
    required this.timeline,
    required this.annonceStats,
    required this.selectedPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DashboardAccordion(
          user: user,
          globalStats: globalStats,
          revenue: revenue,
          timeline: timeline,
          selectedPeriod: selectedPeriod,
        ),
        const SizedBox(height: 8),
        _AnnonceAccordion(annonceStats: annonceStats),
      ],
    );
  }
}

class _DashboardAccordion extends StatelessWidget {
  final User user;
  final SellerGlobalStats globalStats;
  final SellerRevenue revenue;
  final List<RevenuePoint> timeline;
  final RevenuePeriod selectedPeriod;

  const _DashboardAccordion({
    required this.user,
    required this.globalStats,
    required this.revenue,
    required this.timeline,
    required this.selectedPeriod,
  });

  String _formatAmount(double amount) {
    return NumberFormat('#,###', 'fr_FR').format(amount).replaceAll(',', ' ');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: EdgeInsets.zero,
          leading: const Icon(Icons.bar_chart_rounded, color: Color(0xFF2E7D32)),
          title: Text(
            '📊 ${l10n.views}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          trailing: _PeriodDropdown(
            selected: selectedPeriod,
            onChanged: (p) => context.read<StatsDashboardBloc>().add(
              StatsDashboardEvent.changePeriod(
                  sellerId: user.id, period: p),
            ),
          ),
          children: [
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _KpiTile(
                          icon: '👁️',
                          label: l10n.views,
                          value: '${globalStats.totalViews}',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _KpiTile(
                          icon: '❤️',
                          label: l10n.favorites,
                          value: '${globalStats.totalFavorites}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _KpiTile(
                          icon: '📞',
                          label: l10n.contact,
                          value: '${globalStats.totalContacts}',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _KpiTile(
                          icon: '🤝',
                          label: l10n.sold,
                          value: '${globalStats.soldAnnonces}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32).withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '📈 Taux de conversion',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${globalStats.contactRate.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32).withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '💰 CA — ${_formatAmount(revenue.totalRevenue)} ${l10n.mad}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${revenue.soldCount} ${l10n.sold} · moy. ${_formatAmount(revenue.averagePrice)} ${l10n.mad}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (timeline.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 160,
                      child: RevenueChart(
                        points: timeline,
                        period: selectedPeriod,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnnonceAccordion extends StatefulWidget {
  final List<AnnonceStats> annonceStats;
  const _AnnonceAccordion({required this.annonceStats});

  @override
  State<_AnnonceAccordion> createState() => _AnnonceAccordionState();
}

class _AnnonceAccordionState extends State<_AnnonceAccordion> {
  AnnonceStatus? _filter;

  List<AnnonceStats> get _filtered {
    if (_filter == null) return widget.annonceStats;
    return widget.annonceStats.where((a) => a.status == _filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final active = widget.annonceStats.where((a) => a.status == AnnonceStatus.active).length;

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: EdgeInsets.zero,
          leading: const Text('🐑', style: TextStyle(fontSize: 20)),
          title: Text(
            '${l10n.myAnnonces} (${widget.annonceStats.length})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          trailing: _StatusDropdown(
            selected: _filter,
            onChanged: (s) => setState(() => _filter = s),
          ),
          children: [
            const Divider(height: 1),
            if (_filtered.isEmpty)
              Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    l10n.noMyAnnonces,
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
              )
            else
              ..._filtered.map((s) => _AnnonceStatRow(stats: s)),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
              child: OutlinedButton.icon(
                onPressed: () => context.push('/annonces/new'),
                icon: const Icon(Icons.add, size: 16),
                label: Text(l10n.newAnnonce),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  foregroundColor: const Color(0xFF2E7D32),
                  side: const BorderSide(color: Color(0xFF2E7D32)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnnonceStatRow extends StatelessWidget {
  final AnnonceStats stats;
  const _AnnonceStatRow({required this.stats});

  String _formatPrice(double price) {
    return NumberFormat('#,###', 'fr_FR').format(price).replaceAll(',', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/annonces/${stats.annonceId}'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: stats.mainPhotoUrl != null
                  ? Image.network(
                stats.mainPhotoUrl!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              )
                  : _placeholder(),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stats.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${_formatPrice(stats.price)} DH',
                    style: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _MiniStat(icon: Icons.visibility_outlined, value: '${stats.viewCount}'),
                      const SizedBox(width: 10),
                      _MiniStat(icon: Icons.favorite_border, value: '${stats.favoritesCount}'),
                      const SizedBox(width: 10),
                      _MiniStat(icon: Icons.chat_bubble_outline, value: '${stats.contactsCount}'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            _StatusBadge(status: stats.status),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 56,
      height: 56,
      color: Colors.grey.shade100,
      child: const Icon(Icons.image_not_supported_outlined,
          color: Colors.grey, size: 20),
    );
  }
}

class _SettingsAccordion extends StatelessWidget {
  final User user;
  const _SettingsAccordion({required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: EdgeInsets.zero,
          leading: const Icon(Icons.settings_outlined, color: Colors.grey),
          title: Text(
            '⚙️ ${l10n.options}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          children: [
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.lock_outline, size: 20),
              title: Text(l10n.changePassword),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => context.push('/profile/change-password'),
            ),
            ListTile(
              leading: const Icon(Icons.storefront_outlined, size: 20),
              title: Text(l10n.myAnnonces),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => context.push('/profile/my-annonces/${user.id}'),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border, size: 20),
              title: Text(l10n.myFavorites),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => context.push('/profile/favorites'),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined, size: 20),
              title: Text(l10n.myAlerts),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () => context.push('/profile/alerts'),
            ),
            ListTile(
              leading: const Icon(Icons.language, size: 20),
              title: Text(l10n.language),
              trailing: const LanguageSelector(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Text('💬', style: TextStyle(fontSize: 16)),
        label: const Text('Contacter le support WhatsApp'),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          foregroundColor: const Color(0xFF25D366),
          side: const BorderSide(color: Color(0xFF25D366)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton.icon(
        onPressed: () => _confirmLogout(context),
        icon: const Icon(Icons.logout, size: 18),
        label: Text(l10n.logout),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          foregroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            child: Text(l10n.logout,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _PeriodDropdown extends StatelessWidget {
  final RevenuePeriod selected;
  final ValueChanged<RevenuePeriod> onChanged;

  const _PeriodDropdown({required this.selected, required this.onChanged});

  String _label(RevenuePeriod p) => switch (p) {
    RevenuePeriod.week => 'Semaine',
    RevenuePeriod.month => 'Ce mois',
    RevenuePeriod.year => 'Année',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<RevenuePeriod>(
        value: selected,
        isDense: true,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF2E7D32),
          fontWeight: FontWeight.w600,
        ),
        items: RevenuePeriod.values
            .map((p) => DropdownMenuItem(value: p, child: Text(_label(p))))
            .toList(),
        onChanged: (p) { if (p != null) onChanged(p); },
      ),
    );
  }
}

class _StatusDropdown extends StatelessWidget {
  final AnnonceStatus? selected;
  final ValueChanged<AnnonceStatus?> onChanged;

  const _StatusDropdown({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton<AnnonceStatus?>(
        value: selected,
        isDense: true,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF2E7D32),
          fontWeight: FontWeight.w600,
        ),
        items: [
          DropdownMenuItem(value: null, child: Text(l10n.all)),
          DropdownMenuItem(value: AnnonceStatus.active, child: Text(l10n.success)),
          DropdownMenuItem(value: AnnonceStatus.sold, child: Text(l10n.sold)),
          DropdownMenuItem(value: AnnonceStatus.suspended, child: Text(l10n.suspended)),
        ],
        onChanged: onChanged,
      ),
    );
  }
}

class _KpiTile extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const _KpiTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF2E7D32),
                ),
              ),
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final AnnonceStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      AnnonceStatus.active => (const Color(0xFF4CAF50), 'ACTIVE'),
      AnnonceStatus.sold => (const Color(0xFF2196F3), 'VENDUE'),
      AnnonceStatus.suspended => (Colors.orange, 'SUSPENDU'),
      _ => (Colors.grey, status.name.toUpperCase()),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String value;
  const _MiniStat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Colors.grey.shade500),
        const SizedBox(width: 3),
        Text(value, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      ],
    );
  }
}

class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(
          4,
              (_) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorBanner({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 40, color: Colors.red),
          const SizedBox(height: 10),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: onRetry,
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFF2E7D32)),
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}