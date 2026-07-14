import 'package:flutter/material.dart';
import '../../domain/entities/annonce.dart';

class AnnonceCard extends StatelessWidget {
  final Annonce annonce;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;

  const AnnonceCard({
    super.key,
    required this.annonce,
    this.onTap,
    this.onFavoriteToggle,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _MediaPreview(annonce: annonce),
                if (annonce.isTopLot)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _Badge(
                      label: 'Top Lot',
                      color: Colors.amber.shade700,
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: onFavoriteToggle,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    annonce.title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    annonce.breed,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${annonce.price.toStringAsFixed(0)} MAD',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (annonce.priceNegotiable)
                        const _Badge(
                          label: 'Négociable',
                          color: Colors.green,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text(
                        annonce.region,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey.shade600),
                      ),
                      if (annonce.distanceKm != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          '${annonce.distanceKm!.toStringAsFixed(0)} km',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey.shade500),
                        ),
                      ],
                    ],
                  ),
                  if (annonce.deliveryAvailable) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.local_shipping_outlined,
                            size: 14, color: Colors.blue),
                        const SizedBox(width: 4),
                        Text(
                          'Livraison disponible',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.blue),
                        ),
                      ],
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

class _MediaPreview extends StatelessWidget {
  final Annonce annonce;

  const _MediaPreview({required this.annonce});

  @override
  Widget build(BuildContext context) {
    if (annonce.medias.isEmpty) {
      return Container(
        height: 180,
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined,
              size: 48, color: Colors.grey),
        ),
      );
    }
    return SizedBox(
      height: 180,
      child: Image.network(
        annonce.medias.first.url,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: Icon(Icons.broken_image_outlined,
                size: 48, color: Colors.grey),
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
