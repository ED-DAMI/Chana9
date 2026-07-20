import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'package:ma_chana9_app/features/annonces/presentation/bloc/annonce_detail_bloc.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/annonce.dart';
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
                const SnackBar(content: Text('Action effectuée avec succès')),
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
          return state.when(
            initial: () => const Scaffold(
                body: Center(child: CircularProgressIndicator())),
            loading: () => const Scaffold(
                body: Center(child: CircularProgressIndicator())),
            loaded: (annonce) => _AnnonceDetailView(annonce: annonce),
            actionSuccess: (annonce) => _AnnonceDetailView(annonce: annonce),
            deleted: () => const Scaffold(body: SizedBox.shrink()),
            failure: (message) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text(message)),
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
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: annonce.medias.isNotEmpty
                  ? PageView.builder(
                itemCount: annonce.medias.length,
                itemBuilder: (_, index) => Image.network(
                  "${ApiConstants.baseUrl_photos}/${annonce.medias[index].url}",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image_outlined,
                        size: 64, color: Colors.grey),
                  ),
                ),
              )
                  : Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported_outlined,
                    size: 64, color: Colors.grey),
              ),
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
                      value: 'top_lot', child: Text('Top Lot (7j)')),
                  const PopupMenuItem(value: 'edit', child: Text('Modifier')),
                  const PopupMenuItem(
                      value: 'delete',
                      child: Text('Supprimer',
                          style: TextStyle(color: Colors.red))),
                  const PopupMenuItem(value: 'flag', child: Text('Signaler')),
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
                    children: [
                      Expanded(
                        child: Text(annonce.title,
                            style: theme.textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      if (annonce.isTopLot)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade700,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('TOP LOT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${annonce.price.toStringAsFixed(0)} MAD${annonce.priceNegotiable ? ' (négociable)' : ''}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                      icon: Icons.category_outlined,
                      label: 'Race',
                      value: annonce.breed),
                  if (annonce.gender != null)
                    _InfoRow(
                        icon: Icons.transgender,
                        label: 'Genre',
                        value: annonce.gender!.name),
                  if (annonce.estimatedWeight != null)
                    _InfoRow(
                        icon: Icons.monitor_weight_outlined,
                        label: 'Poids estimé',
                        value: '${annonce.estimatedWeight} kg'),
                  if (annonce.effectiveAgeMonths != null)
                    _InfoRow(
                        icon: Icons.cake_outlined,
                        label: 'Âge',
                        value: '${annonce.effectiveAgeMonths} mois'),
                  _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Région',
                      value: annonce.region),
                  if (annonce.addressLabel != null)
                    _InfoRow(
                        icon: Icons.place_outlined,
                        label: 'Adresse',
                        value: annonce.addressLabel!),
                  if (annonce.deliveryAvailable)
                    _InfoRow(
                        icon: Icons.local_shipping_outlined,
                        label: 'Livraison',
                        value:
                        'Disponible${annonce.deliveryRadiusKm != null ? ' (${annonce.deliveryRadiusKm} km)' : ''}${annonce.deliveryPrice != null ? ' — ${annonce.deliveryPrice} MAD' : ''}'),
                  if (annonce.eligibleForAid)
                    _InfoRow(
                        icon: Icons.verified_outlined,
                        label: 'Aides',
                        value: 'Éligible aux aides'),
                  const SizedBox(height: 16),
                  if (annonce.description != null) ...[
                    Text('Description',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(annonce.description!,
                        style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
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
      case 'edit':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => AnnonceFormPage(annonce: annonce),
        ));
        break;
      case 'delete':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Supprimer l\'annonce'),
            content: const Text(
                'Êtes-vous sûr de vouloir supprimer cette annonce ?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Annuler')),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  bloc.add(AnnonceDetailEvent.delete(annonce.id));
                },
                child: const Text('Supprimer',
                    style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
        break;
      case 'flag':
        bloc.add(AnnonceDetailEvent.flag(
          id: annonce.id,
          body: {'reason': 'inappropriate'},
        ));
        break;
    }
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 8),
          Text('$label : ',
              style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}