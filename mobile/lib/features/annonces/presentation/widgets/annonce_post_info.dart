import 'package:flutter/material.dart';
import '../../domain/entities/annonce.dart';

class AnnoncePostInfo extends StatelessWidget {
  final Annonce annonce;

  const AnnoncePostInfo({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            annonce.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Text(
                '${annonce.price.toStringAsFixed(0)} MAD',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (annonce.priceType != null) ...[
                const SizedBox(width: 6),
                _Badge(
                  label: annonce.priceType!.name,
                  color: Colors.grey.shade600,
                ),
              ],
              if (annonce.priceNegotiable) ...[
                const SizedBox(width: 6),
                _Badge(
                  label: 'Négociable',
                  color: Colors.green.shade600,
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              _InfoChip(
                icon: Icons.pets_outlined,
                label: annonce.breed.name,
              ),
              if (annonce.gender != null)
                _InfoChip(
                  icon: Icons.transgender,
                  label: annonce.gender!.name == 'male' ? 'Mâle' : 'Femelle',
                ),
              if (annonce.ageMonths != null)
                _InfoChip(
                  icon: Icons.cake_outlined,
                  label: '${annonce.ageMonths} mois',
                ),
              if (annonce.weightKg != null)
                _InfoChip(
                  icon: Icons.monitor_weight_outlined,
                  label: '${annonce.weightKg} kg',
                ),
              if (annonce.headCount != null && annonce.headCount! > 1)
                _InfoChip(
                  icon: Icons.group_outlined,
                  label: '${annonce.headCount} têtes',
                ),
              if (annonce.dentition != null)
                _InfoChip(
                  icon: Icons.info_outline,
                  label: annonce.dentition!.name,
                ),
              if (annonce.deliveryAvailable)
                _InfoChip(
                  icon: Icons.local_shipping_outlined,
                  label: 'Livraison',
                  color: Colors.blue.shade700,
                ),
              if (annonce.boardingAvailable == true)
                _InfoChip(
                  icon: Icons.home_outlined,
                  label: 'Pension',
                  color: Colors.purple.shade700,
                ),
              if (annonce.onssaTagNumber != null)
                _InfoChip(
                  icon: Icons.verified_outlined,
                  label: 'ONSSA',
                  color: Colors.green.shade700,
                ),
              if (annonce.distanceKm != null)
                _InfoChip(
                  icon: Icons.social_distance_outlined,
                  label: '${annonce.distanceKm!.toStringAsFixed(1)} km',
                ),
            ],
          ),
        ],
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

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? Colors.grey.shade700;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: c),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}