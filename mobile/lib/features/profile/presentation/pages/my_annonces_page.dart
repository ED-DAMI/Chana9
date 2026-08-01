import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'package:ma_chana9_app/injection_container.dart';
import '../../../annonces/domain/entities/annonce.dart';
import '../../../annonces/presentation/pages/annonce_form_page.dart';
import '../../../annonces/presentation/bloc/annonce_bloc.dart';

class MyAnnoncesPage extends StatefulWidget {
  final String sellerId;

  const MyAnnoncesPage({super.key, required this.sellerId});

  @override
  State<MyAnnoncesPage> createState() => _MyAnnoncesPageState();
}

class _MyAnnoncesPageState extends State<MyAnnoncesPage> {
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    context.read<AnnonceBloc>().add(AnnonceEvent.loadAnnoncesBySeller(
      sellerId: widget.sellerId,
      page: 0,
      size: _pageSize,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(l10n.myAnnonces),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/annonces/new'),
          ),
        ],
      ),
      body: BlocConsumer<AnnonceBloc, AnnonceState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(message), backgroundColor: Colors.red),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () =>
            const Center(child: CircularProgressIndicator()),
            annonceListLoaded: (data) {
              if (data.content.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🐑',
                          style: TextStyle(fontSize: 64)),
                      const SizedBox(height: 16),
                      Text(l10n.noMyAnnonces),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        onPressed: () => context.push('/annonces/new'),
                        icon: const Icon(Icons.add),
                        label: Text(l10n.createAnnonce),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async => _load(),
                child: ListView.builder(
                  itemCount: data.content.length,
                  itemBuilder: (context, index) {
                    final annonce = data.content[index];
                    return _MyAnnonceCard(
                      annonce: annonce,
                      onTap: () =>
                          context.push('/annonces/${annonce.id}'),
                    );
                  },
                ),
              );
            },
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _load,
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

class _MyAnnonceCard extends StatelessWidget {
  final Annonce annonce;
  final VoidCallback onTap;

  const _MyAnnonceCard({required this.annonce, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: annonce.medias.isNotEmpty
                    ? Image.network(
                  "${ApiConstants.baseUrl_photos}/${annonce.medias.first.url}",
                  width: 72,
                  height: 72,
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
                      annonce.title,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${annonce.price.toStringAsFixed(0)} MAD',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _StatusChip(status: annonce.status.name),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => sl<AnnonceBloc>(),
                      child: AnnonceFormPage(annonce: annonce),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image_not_supported_outlined,
          color: Colors.grey),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status.toUpperCase()) {
      'ACTIVE' => Colors.green,
      'SUSPENDED' => Colors.orange,
      'SOLD' => Colors.blue,
      'EXPIRED' => Colors.red,
      _ => Colors.grey,
    };

    final label = switch (status.toUpperCase()) {
      'ACTIVE' => 'Active',
      'SUSPENDED' => 'Suspendue',
      'SOLD' => 'Vendue',
      'EXPIRED' => 'Expirée',
      _ => status,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
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