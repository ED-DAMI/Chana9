import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue_point.freezed.dart';

@freezed
abstract class RevenuePoint with _$RevenuePoint {
  const factory RevenuePoint({
    required DateTime date,
    required double revenue,
    required int soldCount,
  }) = _RevenuePoint;
}