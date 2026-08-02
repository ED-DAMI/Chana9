import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/annonce.dart';

class AnnoncePostHeader extends StatelessWidget {
  final Annonce annonce;
  final VoidCallback? onMoreTap;

  const AnnoncePostHeader({
    super.key,
    required this.annonce,
    this.onMoreTap,
  });

  String _initials(String sellerId) {
    return sellerId.substring(0, 2).toUpperCase();
  }

  Color _avatarColor(String sellerId) {
    final colors = [
      const Color(0xFF2E7D32),
      const Color(0xFF1565C0),
      const Color(0xFF6A1B9A),
      const Color(0xFFE65100),
      const Color(0xFF00695C),
    ];
    return colors[sellerId.length % colors.length];
  }

  String _timeAgo(BuildContext context, DateTime? date) {
    if (date == null) return '';
    final l10n = AppLocalizations.of(context)!;
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return l10n.justNow;
    if (diff.inMinutes < 60) return l10n.minutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return l10n.hoursAgo(diff.inHours);
    if (diff.inDays < 7) return l10n.daysAgo(diff.inDays);
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: _avatarColor(annonce.sellerId),
            child: Text(
              _initials(annonce.sellerId),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${l10n.seller} · ${annonce.sellerId.substring(0, 8)}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 12, color: Colors.grey),
                    const SizedBox(width: 2),
                    Text(
                      annonce.region,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('·',
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 6),
                    Text(
                      _timeAgo(context, annonce.createdAt),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: onMoreTap,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}