import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ma_chana9_app/shared/enums/annonce_status.dart';


class AnnonceStatsCard extends StatelessWidget {
  final AnnonceStats stats;

  const AnnonceStatsCard({super.key, required this.stats});

  String _formatPrice(double price) {
    final formatter = NumberFormat('#,###', 'fr_FR');
    return '${formatter.format(price)} MAD';
  }

  String _formatDate(DateTime date) =>
      DateFormat('dd MMM', 'fr_FR').format(date);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.push('/annonces/${stats.annonceId}'),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Photo
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: stats.mainPhotoUrl != null
                  ? CachedNetworkImage(
                imageUrl: stats.mainPhotoUrl!,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => _placeholder(),
              )
                  : _placeholder(),
            ),
            const SizedBox(width: 12),

            // Infos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          stats.title,
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _StatusBadge(status: stats.status),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _StatChip(
                          icon: Icons.visibility_outlined,
                          value: '${stats.viewCount}'),
                      const SizedBox(width: 8),
                      _StatChip(
                          icon: Icons.favorite_border,
                          value: '${stats.favoritesCount}'),
                      const SizedBox(width: 8),
                      _StatChip(
                          icon: Icons.chat_bubble_outline,
                          value: '${stats.contactsCount}'),
                    ],
                  ),
                  if (stats.status == AnnonceStatus.sold &&
                      stats.soldAt != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${_formatPrice(stats.price)} · ${_formatDate(stats.soldAt!)}',
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
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

  Widget _placeholder() {
    return Container(
      width: 64,
      height: 64,
      color: Colors.grey.shade200,
      child: const Icon(Icons.image_not_supported_outlined,
          color: Colors.grey),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final AnnonceStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      AnnonceStatus.active => (Colors.green, 'ACTIVE'),
      AnnonceStatus.sold => (Colors.blue, 'VENDUE'),
      AnnonceStatus.suspended => (Colors.red, 'SUSPENDUE'),
      _ => (Colors.grey, status.name.toUpperCase()),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(label,
          style: TextStyle(
              color: color,
              fontSize: 9,
              fontWeight: FontWeight.bold)),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatChip({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: Colors.grey.shade500),
        const SizedBox(width: 3),
        Text(value,
            style:
            TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}