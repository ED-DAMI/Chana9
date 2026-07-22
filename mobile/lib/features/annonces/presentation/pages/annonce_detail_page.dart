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
      create: (context) => sl<AnnonceDetailBloc>()..add(AnnonceDetailEvent.load(annonceId)),
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

  // Helper pour capitaliser le texte des enums
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

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
                onSelected: (value) => _handleMenuAction(context, value, annonce),
                itemBuilder: (_) => [
                  if (annonce.status == AnnonceStatus.active)
                    const PopupMenuItem(value: 'suspend', child: Text('Suspendre')),
                  if (annonce.status == AnnonceStatus.suspended)
                    const PopupMenuItem(value: 'reactivate', child: Text('Réactiver')),
                  if (annonce.status == AnnonceStatus.active)
                    const PopupMenuItem(value: 'sold', child: Text('Marquer vendu')),
                  const PopupMenuItem(value: 'top_lot', child: Text('Promouvoir (Top Lot)')),
                  const PopupMenuItem(value: 'edit', child: Text('Modifier')),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Supprimer', style: TextStyle(color: Colors.red)),
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
                  // Titre et Badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          annonce.title,
                          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      _StatusBadge(status: annonce.status),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Prix
                  Text(
                    '${annonce.price.toStringAsFixed(0)} MAD',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (annonce.priceNegotiable)
                    Text('Prix négociable', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),

                  const Divider(height: 32),

                  // Caractéristiques
                  _InfoRow(
                      icon: Icons.pets,
                      label: 'Race',
                      value: _capitalize(annonce.breed.name)
                  ),
                  if (annonce.gender != null)
                    _InfoRow(
                        icon: Icons.transgender,
                        label: 'Genre',
                        value: _capitalize(annonce.gender!.name)
                    ),
                  if (annonce.ageMonths != null)
                    _InfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Âge',
                        value: '${annonce.ageMonths} mois'
                    ),
                  _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Localisation',
                      value: '${annonce.region}${annonce.addressLabel != null ? ' (${annonce.addressLabel})' : ''}'
                  ),

                  if (annonce.deliveryAvailable)
                    _InfoRow(
                      icon: Icons.local_shipping_outlined,
                      label: 'Livraison',
                      value: 'Disponible ${annonce.deliveryPrice != null ? '(${annonce.deliveryPrice} MAD)' : ''}',
                    ),

                  const SizedBox(height: 24),

                  // Description
                  Text('Description', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    annonce.description ?? 'Aucune description fournie.',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),

                  const SizedBox(height: 100), // Espace pour le scroll
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {}, // Intégrer la logique de chat
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text('Message'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {}, // Intégrer la logique d'appel
              icon: const Icon(Icons.phone),
              label: const Text('Appeler'),
            ),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action, Annonce annonce) {
    final bloc = context.read<AnnonceDetailBloc>();
    switch (action) {
      case 'edit':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AnnonceFormPage(annonce: annonce)),
        ).then((_) => bloc.add(AnnonceDetailEvent.load(annonce.id))); // Recharger au retour
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
    }
  }

  void _confirmDelete(BuildContext context, AnnonceDetailBloc bloc, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'annonce ?'),
        content: const Text('Cette action est irréversible.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(AnnonceDetailEvent.delete(id));
            },
            child: const Text('Supprimer', style: TextStyle(color: Colors.red)),
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
    Color color;
    String label;

    switch (status) {
      case AnnonceStatus.active:
        return const SizedBox.shrink(); // On n'affiche rien si c'est actif
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
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Text('$label :', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}