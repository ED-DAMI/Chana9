import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/annonce.dart';
import '../bloc/annonce_bloc.dart';
import 'annonce_photo_carousel.dart';
import 'annonce_post_header.dart';
import 'annonce_post_info.dart';
import 'annonce_post_actions.dart';

class AnnoncePostCard extends StatefulWidget {
  final Annonce annonce;
  final VoidCallback? onTap;
  final VoidCallback? onContact;

  const AnnoncePostCard({
    super.key,
    required this.annonce,
    this.onTap,
    this.onContact,
  });

  @override
  State<AnnoncePostCard> createState() => _AnnoncePostCardState();
}

class _AnnoncePostCardState extends State<AnnoncePostCard> {
  bool _isFavorite = false;
  bool _isExpanded = false;

  static const int _descMaxLines = 2;

  void _toggleFavorite() {
    setState(() => _isFavorite = !_isFavorite);
    if (_isFavorite) {
      context
          .read<AnnonceBloc>()
          .add(AnnonceEvent.addFavorite(widget.annonce.id));
    } else {
      context
          .read<AnnonceBloc>()
          .add(AnnonceEvent.removeFavorite(widget.annonce.id));
    }
  }

  void _showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: const Text('Signaler cette annonce'),
              onTap: () {
                Navigator.pop(context);
                context.read<AnnonceBloc>().add(AnnonceEvent.flagAnnonce(
                      id: widget.annonce.id,
                      body: {'reason': 'inappropriate'},
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Partager'),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final description = widget.annonce.description;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────
            AnnoncePostHeader(
              annonce: widget.annonce,
              onMoreTap: () => _showMoreMenu(context),
            ),

            // ── Carousel photos ───────────────────────────────────────
            AnnoncePhotoCarousel(annonce: widget.annonce),

            const SizedBox(height: 10),

            // ── Infos ─────────────────────────────────────────────────
            AnnoncePostInfo(annonce: widget.annonce),

            // ── Description ───────────────────────────────────────────
            if (description != null && description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCrossFade(
                      firstChild: Text(
                        description,
                        style: theme.textTheme.bodyMedium,
                        maxLines: _descMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                      secondChild: Text(
                        description,
                        style: theme.textTheme.bodyMedium,
                      ),
                      crossFadeState: _isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 200),
                    ),
                    if (description.length > 80)
                      GestureDetector(
                        onTap: () =>
                            setState(() => _isExpanded = !_isExpanded),
                        child: Text(
                          _isExpanded ? 'Voir moins' : 'Voir plus...',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 10),

            // ── Actions ───────────────────────────────────────────────
            AnnoncePostActions(
              annonce: widget.annonce,
              isFavorite: _isFavorite,
              onFavoriteToggle: _toggleFavorite,
              onContact: widget.onContact,
              onShare: () {},
            ),
          ],
        ),
      ),
    );
  }
}
