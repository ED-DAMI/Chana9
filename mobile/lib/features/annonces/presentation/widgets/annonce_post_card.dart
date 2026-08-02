import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/annonce.dart';
import '../bloc/annonce_detail_bloc.dart';
import '../widgets/annonce_photo_carousel.dart';
import '../widgets/annonce_post_header.dart';
import '../widgets/annonce_post_info.dart';
import '../widgets/annonce_post_actions.dart';
import 'package:ma_chana9_app/features/annonces/presentation/pages/report_sheet.dart';

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
          .read<AnnonceDetailBloc>()
          .add(AnnonceDetailEvent.addFavorite(widget.annonce.id));
    } else {
      context
          .read<AnnonceDetailBloc>()
          .add(AnnonceDetailEvent.removeFavorite(widget.annonce.id));
    }
  }

  void _showMoreMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              title: Text(l10n.report),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => BlocProvider.value(
                    value: context.read<AnnonceDetailBloc>(),
                    child: ReportSheet(annonceId: widget.annonce.id),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: Text(l10n.share),
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
    final l10n = AppLocalizations.of(context)!;
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
            AnnoncePostHeader(
              annonce: widget.annonce,
              onMoreTap: () => _showMoreMenu(context),
            ),
            AnnoncePhotoCarousel(annonce: widget.annonce),
            const SizedBox(height: 10),
            AnnoncePostInfo(annonce: widget.annonce),
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
                          _isExpanded ? l10n.see_less : l10n.see_more,
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