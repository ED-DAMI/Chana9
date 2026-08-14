import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/features/annonces/presentation/bloc/annonce_detail_bloc.dart';
import 'package:ma_chana9_app/features/annonces/presentation/pages/report_sheet.dart';
import 'package:ma_chana9_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import '../../../../injection_container.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/annonce.dart';
import '../widgets/annonce_photo_carousel.dart';
import 'annonce_form_page.dart';

class AnnonceDetailPage extends StatelessWidget {
  final String annonceId;

  const AnnonceDetailPage({super.key, required this.annonceId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => sl<AnnonceDetailBloc>()
        ..add(AnnonceDetailEvent.load(annonceId)),
      child: BlocConsumer<AnnonceDetailBloc, AnnonceDetailState>(
        listener: (context, state) {
          state.whenOrNull(
            actionSuccess: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.actionSuccess)),
              );
            },
            deleted: () => Navigator.of(context).pop(),
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            failureWithCode: (code) {
              final message = switch (code) {
                'alreadyReported' => l10n.alreadyReported,
                'cannotReportOwnAnnonce' => l10n.cannotReportOwnAnnonce,
                'alreadyInFavorites' => l10n.alreadyInFavorites,
                _ => l10n.error,
              };
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (annonce) => _AnnonceDetailView(annonce: annonce),
            actionSuccess: (annonce) => _AnnonceDetailView(annonce: annonce),
            failure: (message) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text(message)),
            ),
            orElse: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

class _AnnonceDetailView extends StatelessWidget {
  final Annonce annonce;

  const _AnnonceDetailView({required this.annonce});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // ✅ Récupérer l'utilisateur connecté depuis AuthBloc
    final currentUser = context.read<AuthBloc>().state.whenOrNull(
      authenticated: (user) => user,
    );
    final isOwner = currentUser != null && currentUser.id == annonce.sellerId;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: AnnoncePhotoCarousel(annonce: annonce, height: 350),
            ),
            actions: [
              if (!isOwner)
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () => context
                      .read<AnnonceDetailBloc>()
                      .add(AnnonceDetailEvent.addFavorite(annonce.id)),
                ),
              if (isOwner)
                PopupMenuButton<String>(
                  onSelected: (value) =>
                      _handleMenuAction(context, value, annonce),
                  itemBuilder: (_) => [
                    if (annonce.status == AnnonceStatus.active)
                      PopupMenuItem(
                          value: 'suspend', child: Text(l10n.suspend)),
                    if (annonce.status == AnnonceStatus.suspended)
                      PopupMenuItem(
                          value: 'reactivate', child: Text(l10n.reactivate)),
                    if (annonce.status == AnnonceStatus.active)
                      PopupMenuItem(
                          value: 'sold', child: Text(l10n.markAsSold)),
                    PopupMenuItem(
                        value: 'top_lot', child: Text(l10n.promote)),
                    PopupMenuItem(
                        value: 'edit', child: Text(l10n.edit_annonce)),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(l10n.deleteAnnonce,
                          style: const TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              // ✅ Signaler visible pour tout le monde sauf le propriétaire
              if (!isOwner)
                PopupMenuButton<String>(
                  onSelected: (value) =>
                      _handleMenuAction(context, value, annonce),
                  itemBuilder: (_) => [
                    PopupMenuItem(
                        value: 'report', child: Text(l10n.report)),
                  ],
                ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          annonce.title,
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (annonce.isTopLot) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(l10n.topLot,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                        ),
                        const SizedBox(width: 8),
                      ],
                      _StatusBadge(status: annonce.status),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        '${annonce.price.toStringAsFixed(0)} ${l10n.mad}',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (annonce.priceType != null) ...[
                        const SizedBox(width: 8),
                        _Badge(
                          label: annonce.priceType!.name,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ],
                  ),
                  if (annonce.priceNegotiable)
                    Text(l10n.priceNegotiable,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13)),

                  const Divider(height: 32),

                  _SectionTitle(title: l10n.features),
                  _InfoRow(
                      icon: Icons.pets,
                      label: l10n.breed,
                      value: annonce.breed.localizedLabel(context)),
                  if (annonce.gender != null)
                    _InfoRow(
                        icon: Icons.transgender,
                        label: l10n.gender,
                        value: annonce.gender!.name == 'male'
                            ? l10n.male
                            : l10n.female),
                  if (annonce.ageMonths != null)
                    _InfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: l10n.age,
                        value: '${annonce.ageMonths} ${l10n.months}'),
                  if (annonce.weightKg != null)
                    _InfoRow(
                        icon: Icons.monitor_weight_outlined,
                        label: l10n.weight,
                        value: '${annonce.weightKg} ${l10n.kg}'),
                  if (annonce.dentition != null)
                    _InfoRow(
                        icon: Icons.info_outline,
                        label: l10n.dentition,
                        value: annonce.dentition!.localizedDisplayName(context)),
                  if (annonce.headCount != null)
                    _InfoRow(
                        icon: Icons.group_outlined,
                        label: l10n.headCount,
                        value: '${annonce.headCount} ${l10n.heads}'),
                  if (annonce.onssaTagNumber != null)
                    _InfoRow(
                        icon: Icons.verified_outlined,
                        label: l10n.onssa,
                        value: annonce.onssaTagNumber!),
                  if (annonce.viewsCount != null)
                    _InfoRow(
                        icon: Icons.visibility_outlined,
                        label: l10n.views,
                        value: '${annonce.viewsCount}'),
                  if (annonce.favoritesCount != null)
                    _InfoRow(
                        icon: Icons.favorite_border,
                        label: l10n.favorites,
                        value: '${annonce.favoritesCount}'),

                  const Divider(height: 32),

                  _SectionTitle(title: l10n.location),
                  _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: l10n.region,
                      value: annonce.region),
                  if (annonce.distanceKm != null)
                    _InfoRow(
                        icon: Icons.social_distance_outlined,
                        label: l10n.distance,
                        value:
                        '${annonce.distanceKm!.toStringAsFixed(1)} ${l10n.km}'),
                  if (annonce.addressLabel != null)
                    _InfoRow(
                        icon: Icons.place_outlined,
                        label: l10n.preciseAddress,
                        value: annonce.addressLabel!),

                  const Divider(height: 32),

                  _SectionTitle(title: l10n.services),
                  if (annonce.deliveryAvailable)
                    _InfoRow(
                        icon: Icons.local_shipping_outlined,
                        label: l10n.delivery,
                        value:
                        '${l10n.available}${annonce.deliveryPrice != null ? ' — ${annonce.deliveryPrice!.toStringAsFixed(0)} ${l10n.mad}' : ''}'),
                  if (annonce.boardingAvailable == true)
                    _InfoRow(
                        icon: Icons.home_outlined,
                        label: l10n.boarding,
                        value:
                        '${l10n.available}${annonce.boardingDailyPrice != null ? ' — ${annonce.boardingDailyPrice!.toStringAsFixed(0)} ${l10n.mad}/${l10n.daysAgo(1)}' : ''}'),
                  if (!annonce.deliveryAvailable &&
                      annonce.boardingAvailable != true)
                    Text(l10n.noServiceAvailable,
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 13)),

                  const Divider(height: 32),

                  _SectionTitle(title: l10n.description),
                  Text(
                    annonce.description?.isNotEmpty == true
                        ? annonce.description!
                        : l10n.noDescription,
                    style:
                    theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      isOwner ? null : _buildBottomContact(theme, l10n, context),
    );
  }

  Widget _buildBottomContact(
      ThemeData theme, AppLocalizations l10n, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5))
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline),
              label: Text(l10n.message),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: Text(l10n.call),
            ),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(
      BuildContext context, String action, Annonce annonce) {
    final bloc = context.read<AnnonceDetailBloc>();
    switch (action) {
      case 'edit':
        Navigator.of(context)
            .push(MaterialPageRoute(
            builder: (_) => AnnonceFormPage(annonce: annonce)))
            .then((_) => bloc.add(AnnonceDetailEvent.load(annonce.id)));
        break;
      case 'delete':
        _confirmDelete(context, bloc, annonce.id);
        break;
      case 'suspend':
        bloc.add(AnnonceDetailEvent.suspend(annonce.id));
        break;
      case 'reactivate':
        bloc.add(AnnonceDetailEvent.reactivate(annonce.id));
        break;
      case 'sold':
        bloc.add(AnnonceDetailEvent.markAsSold(annonce.id));
        break;
      case 'top_lot':
        bloc.add(AnnonceDetailEvent.activateTopLot(
            id: annonce.id, durationDays: 7));
        break;
      case 'report':
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BlocProvider.value(
            value: bloc,
            child: ReportSheet(annonceId: annonce.id),
          ),
        );
        break;
    }
  }

  void _confirmDelete(
      BuildContext context, AnnonceDetailBloc bloc, String id) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.confirmDelete),
        content: Text(l10n.irreversible),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(AnnonceDetailEvent.delete(id));
            },
            child: Text(l10n.deleteAnnonce,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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

class _StatusBadge extends StatelessWidget {
  final AnnonceStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Color color;
    String label;

    switch (status) {
      case AnnonceStatus.active:
        return const SizedBox.shrink();
      case AnnonceStatus.sold:
        color = Colors.blue;
        label = l10n.statusSold;
        break;
      case AnnonceStatus.suspended:
        color = Colors.orange;
        label = l10n.statusSuspended;
        break;
      default:
        color = Colors.grey;
        label = status.name.toUpperCase();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold)),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Text('$label :',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}