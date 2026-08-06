import 'package:flutter/material.dart';
import '../../domain/entities/seller_global_stats.dart';

class SellerKpiCard extends StatelessWidget {
  final SellerGlobalStats stats;

  const SellerKpiCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats.totalAnnonces == 0) {
      return _EmptyKpi();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
        children: [
          _KpiTile(
            icon: Icons.visibility_outlined,
            label: 'Vues',
            value: stats.totalViews,
            color: Colors.blue,
          ),
          _KpiTile(
            icon: Icons.favorite_border,
            label: 'Favoris',
            value: stats.totalFavorites,
            color: Colors.red,
          ),
          _KpiTile(
            icon: Icons.chat_bubble_outline,
            label: 'Contacts',
            value: stats.totalContacts,
            color: Colors.green,
          ),
          _KpiTileDouble(
            icon: Icons.bar_chart_outlined,
            label: 'Taux contact',
            value: '${stats.contactRate.toStringAsFixed(1)}%',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class _KpiTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color color;

  const _KpiTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  State<_KpiTile> createState() => _KpiTileState();
}

class _KpiTileState extends State<_KpiTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: widget.value.toDouble())
        .animate(CurvedAnimation(
        parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: widget.color.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.icon, color: widget.color, size: 20),
          AnimatedBuilder(
            animation: _animation,
            builder: (_, __) => Text(
              _animation.value.toInt().toString(),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.color,
              ),
            ),
          ),
          Text(widget.label,
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}

class _KpiTileDouble extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _KpiTileDouble({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 20),
          Text(value,
              style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: color)),
          Text(label,
              style:
              TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}

class _EmptyKpi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            const Text('🐑', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 8),
            Text(
              'Publiez votre première annonce pour voir vos statistiques',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerKpiCardSkeleton extends StatelessWidget {
  const SellerKpiCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
        children: List.generate(
          4,
              (_) => Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}