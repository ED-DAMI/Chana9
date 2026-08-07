import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/revenue_period.dart';
import '../bloc/stats_dashboard_bloc.dart';

class PeriodSelector extends StatelessWidget {
  final String sellerId;
  final RevenuePeriod selected;
  final bool isLoading;

  const PeriodSelector({
    super.key,
    required this.sellerId,
    required this.selected,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: SegmentedButton<RevenuePeriod>(
              segments: RevenuePeriod.values
                  .map((p) => ButtonSegment(
                value: p,
                label: Text(p.displayName),
              ))
                  .toList(),
              selected: {selected},
              onSelectionChanged: (val) {
                context.read<StatsDashboardBloc>().add(
                  StatsDashboardEvent.changePeriod(
                    sellerId: sellerId,
                    period: val.first,
                  ),
                );
              },
            ),
          ),
          if (isLoading) ...[
            const SizedBox(width: 12),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ],
      ),
    );
  }
}