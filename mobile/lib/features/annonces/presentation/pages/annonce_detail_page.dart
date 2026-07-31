import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/features/annonces/presentation/bloc/annonce_detail_bloc.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/annonce.dart';
import '../widgets/annonce_photo_carousel.dart';
import 'annonce_form_page.dart';

class AnnonceDetailPage extends StatelessWidget {
  final String annonceId;

  const AnnonceDetailPage({super.key, required this.annonceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnnonceDetailBloc>()
        ..add(AnnonceDetailEvent.load(annonceId)),
      child: BlocConsumer<AnnonceDetailBloc, AnnonceDetailState>(
        listener: (context, state) {
          state.whenOrNull(
            actionSuccess: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Action effectuée avec succès ✅')),
              );
            },
            deleted: () => Navigator.of(context).pop(),
            failure: (message) {
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
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => context
                    .read<AnnonceDetailBloc>()
                    .add(AnnonceDetailEvent.addFavorite(annonce.id)),
              ),
              PopupMenuButton<String>(
                onSelected: (value) =>
                    _handleMenuAction(context, value, annonce),
                itemBuilder: (_) => [
                  if (annonce.status == AnnonceStatus.active)
                    const PopupMenuItem(
                        value: 'suspend', child: Text('Suspendre')),
                  if (annonce.status == AnnonceStatus.suspended)
                    const PopupMenuItem(
                        value: 'reactivate', child: Text('Réactiver')),
                  if (annonce.status == AnnonceStatus.active)
                    const PopupMenuItem(
                        value: 'sold', child: Text('Marquer vendu')),
                  const PopupMenuItem(
                      value: 'top_lot',
                      child: Text('Promouvoir (Top Lot)')),
                  const PopupMenuItem(
                      value: 'edit', child: Text('Modifier')),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Supprimer',
                        style: TextStyle(color: Colors.red)),
                  ),
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
                      if (annonce.isTopLot)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('TOP LOT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                        ),
                      const SizedBox(width: 8),
                      _StatusBadge(status: annonce.status),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        '${annonce.price.toStringAsFixed(0)} MAD',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (annonce.priceType != null) ...[
                        const SizedBox(width: 8),
                        _Badge(
                          label: annonce.priceType!.displayName,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ],
                  ),
                  if (annonce.priceNegotiable)
                    Text('Prix négociable',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13)),

                  const Divider(height: 32),

                  // Caractéristiques animal
                  _SectionTitle(title: 'Caractéristiques'),
                  _InfoRow(
                      icon: Icons.pets,
                      label: 'Race',
                      value: annonce.breed.name),
                  if (annonce.gender != null)
                    _InfoRow(
                        icon: Icons.transgender,
                        label: 'Genre',
                        value: annonce.gender!.name == 'male'
                            ? 'Mâle'
                            : 'Femelle'),
                  if (annonce.ageMonths != null)
                    _InfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Âge',
                        value: '${annonce.ageMonths} mois'),
                  if (annonce.weightKg != null)
                    _InfoRow(
                        icon: Icons.monitor_weight_outlined,
                        label: 'Poids',
                        value: '${annonce.weightKg} kg'),
                  if (annonce.dentition != null)
                    _InfoRow(
                        icon: Icons.info_outline,
                        label: 'Dentition',
                        value: annonce.dentition!.displayName),
                  if (annonce.headCount != null)
                    _InfoRow(
                        icon: Icons.group_outlined,
                        label: 'Nombre de têtes',
                        value: '${annonce.headCount}'),
                  if (annonce.onssaTagNumber != null)
                    _InfoRow(
                        icon: Icons.verified_outlined,
                        label: 'N° ONSSA',
                        value: annonce.onssaTagNumber!),
                  if (annonce.viewsCount != null)
                    _InfoRow(
                        icon: Icons.visibility_outlined,
                        label: 'Vues',
                        value: '${annonce.viewsCount}'),
                  if (annonce.favoritesCount != null)
                    _InfoRow(
                        icon: Icons.favorite_border,
                        label: 'Favoris',
                        value: '${annonce.favoritesCount}'),

                  const Divider(height: 32),

                  // Localisation
                  _SectionTitle(title: 'Localisation'),
                  _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Région',
                      value: annonce.region),
                  if (annonce.distanceKm != null)
                    _InfoRow(
                        icon: Icons.social_distance_outlined,
                        label: 'Distance',
                        value:
                        '${annonce.distanceKm!.toStringAsFixed(1)} km'),
                  if (annonce.addressLabel != null)
                    _InfoRow(
                        icon: Icons.place_outlined,
                        label: 'Adresse',
                        value: annonce.addressLabel!),

                  const Divider(height: 32),

                  _SectionTitle(title: 'Services'),
                  if (annonce.deliveryAvailable)
                    _InfoRow(
                        icon: Icons.local_shipping_outlined,
                        label: 'Livraison',
                        value:
                        'Disponible${annonce.deliveryPrice != null ? ' — ${annonce.deliveryPrice!.toStringAsFixed(0)} MAD' : ''}'),
                  if (annonce.boardingAvailable == true)
                    _InfoRow(
                        icon: Icons.home_outlined,
                        label: 'Pension',
                        value:
                        'Disponible${annonce.boardingDailyPrice != null ? ' — ${annonce.boardingDailyPrice!.toStringAsFixed(0)} MAD/jour' : ''}'),
                  if (!annonce.deliveryAvailable &&
                      annonce.boardingAvailable != true)
                    Text('Aucun service disponible',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 13)),

                  const Divider(height: 32),

                  // Description
                  _SectionTitle(title: 'Description'),
                  Text(
                    annonce.description ?? 'Aucune description fournie.',
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
      bottomNavigationBar: _buildBottomContact(theme),
    );
  }

  Widget _buildBottomContact(ThemeData theme) {
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
              label: const Text('Message'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.phone),
              label: const Text('Appeler'),
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
    }
  }

  void _confirmDelete(
      BuildContext context, AnnonceDetailBloc bloc, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'annonce ?'),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(AnnonceDetailEvent.delete(id));
            },
            child: const Text('Supprimer',
                style: TextStyle(color: Colors.red)),
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
    Color color;
    String label;

    switch (status) {
      case AnnonceStatus.active:
        return const SizedBox.shrink();
      case AnnonceStatus.sold:
        color = Colors.blue;
        label = 'VENDU';
        break;
      case AnnonceStatus.suspended:
        color = Colors.orange;
        label = 'SUSPENDU';
        break;
      default:
        color = Colors.grey;
        label = status.name.toUpperCase();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
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