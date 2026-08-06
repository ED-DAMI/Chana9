import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/seller_revenue.dart';

class RevenueSummaryCard extends StatelessWidget {
  final SellerRevenue revenue;

  const RevenueSummaryCard({super.key, required this.revenue});

  String _formatAmount(double amount) {
    final formatter = NumberFormat('#,###', 'fr_FR');
    return '${formatter.format(amount)} MAD';
  }

  String _formatDate(DateTime date) =>
      DateFormat('d MMM yyyy', 'fr_FR').format(date);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (revenue.soldCount == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Aucune vente sur cette période',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _RevenueBox(
                  icon: Icons.monetization_on_outlined,
                  label: 'Chiffre d\'affaires',
                  value: _formatAmount(revenue.totalRevenue),
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _RevenueBox(
                  icon: Icons.pets_outlined,
                  label: 'Vendus',
                  value: '${revenue.soldCount}',
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${_formatDate(revenue.startDate)} → ${_formatDate(revenue.endDate)}',
            style: TextStyle(
                color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _RevenueBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _RevenueBox({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: color)),
          Text(label,
              style: TextStyle(
                  color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}