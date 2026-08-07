import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/revenue_period.dart';
import '../../domain/entities/revenue_point.dart';

class RevenueChart extends StatelessWidget {
  final List<RevenuePoint> points;
  final RevenuePeriod period;

  const RevenueChart({
    super.key,
    required this.points,
    required this.period,
  });

  bool get _isEmpty => points.every((p) => p.revenue == 0);

  String _formatDate(DateTime date) {
    return switch (period) {
      RevenuePeriod.year => DateFormat('MMM', 'fr_FR').format(date),
      _ => DateFormat('dd/MM').format(date),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'Aucune vente sur cette période',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      );
    }

    final spots = points.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.revenue);
    }).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: SizedBox(
        height: 200,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: theme.colorScheme.primary,
                barWidth: 2.5,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: theme.colorScheme.primary.withOpacity(0.1),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: (points.length / 4).ceilToDouble(),
                  getTitlesWidget: (value, _) {
                    final index = value.toInt();
                    if (index < 0 || index >= points.length) {
                      return const SizedBox.shrink();
                    }
                    return Text(
                      _formatDate(points[index].date),
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 10),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  getTitlesWidget: (value, _) => Text(
                    '${(value / 1000).toStringAsFixed(0)}k',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontSize: 10),
                  ),
                ),
              ),
              topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (_) => FlLine(
                color: Colors.grey.shade200,
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(show: false),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (spots) {
                  return spots.map((spot) {
                    final point = points[spot.x.toInt()];
                    return LineTooltipItem(
                      '${_formatDate(point.date)}\n${point.revenue.toStringAsFixed(0)} MAD\n${point.soldCount} vendu(s)',
                      const TextStyle(
                          color: Colors.white, fontSize: 11),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}