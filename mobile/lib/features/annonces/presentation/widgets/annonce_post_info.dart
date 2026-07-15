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
          // Titre
          Text(
            annonce.title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),

          // Prix + négociable
          Row(
            children: [
              Text(
                '${annonce.price.toStringAsFixed(0)} MAD',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (annonce.priceNegotiable) ...[
                const SizedBox(width: 8),
                _Badge(
                  label: 'Négociable',
                  color: Colors.green.shade600,
                ),
              ],
              if (annonce.eligibleForAid) ...[
                const SizedBox(width: 6),
                _Badge(
                  label: 'Aide éligible',
                  color: Colors.blue.shade600,
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),

          // Infos clés en chips
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              _InfoChip(
                icon: Icons.pets_outlined,
                label: annonce.breed,
              ),
              if (annonce.gender != null)
                _InfoChip(
                  icon: Icons.transgender,
                  label: annonce.gender!.name == 'male' ? 'Mâle' : 'Femelle',
                ),
              if (annonce.estimatedWeight != null)
                _InfoChip(
                  icon: Icons.monitor_weight_outlined,
                  label: '${annonce.estimatedWeight!.toStringAsFixed(0)} kg',
                ),
              if (annonce.effectiveAgeMonths != null)
                _InfoChip(
                  icon: Icons.cake_outlined,
                  label: '${annonce.effectiveAgeMonths} mois',
                ),
              if (annonce.deliveryAvailable)
                _InfoChip(
                  icon: Icons.local_shipping_outlined,
                  label: 'Livraison',
                  color: Colors.blue.shade700,
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
