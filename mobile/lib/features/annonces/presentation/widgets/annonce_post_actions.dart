import 'package:flutter/material.dart';
import '../../domain/entities/annonce.dart';

class AnnoncePostActions extends StatefulWidget {
  final Annonce annonce;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onContact;
  final VoidCallback? onShare;

  const AnnoncePostActions({
    super.key,
    required this.annonce,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onContact,
    this.onShare,
  });

  @override
  State<AnnoncePostActions> createState() => _AnnoncePostActionsState();
}

class _AnnoncePostActionsState extends State<AnnoncePostActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heartAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _heartController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void _handleFavorite() {
    _heartController.forward().then((_) => _heartController.reverse());
    widget.onFavoriteToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            children: [
              // Favori
              Expanded(
                child: _ActionButton(
                  icon: ScaleTransition(
                    scale: _heartAnimation,
                    child: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.isFavorite
                          ? Colors.red
                          : Colors.grey.shade600,
                      size: 20,
                    ),
                  ),
                  label: 'Favori',
                  labelColor: widget.isFavorite
                      ? Colors.red
                      : Colors.grey.shade700,
                  onTap: _handleFavorite,
                ),
              ),

              // Contacter
              Expanded(
                child: _ActionButton(
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  label: 'Contacter',
                  labelColor: theme.colorScheme.primary,
                  onTap: widget.onContact,
                ),
              ),

              // Partager
              Expanded(
                child: _ActionButton(
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  label: 'Partager',
                  labelColor: Colors.grey.shade700,
                  onTap: widget.onShare,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color? labelColor;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.labelColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: labelColor ?? Colors.grey.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
