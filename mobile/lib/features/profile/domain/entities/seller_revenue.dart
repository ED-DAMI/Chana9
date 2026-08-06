import 'package:freezed_annotation/freezed_annotation.dart';
import 'revenue_period.dart';

part 'seller_revenue.freezed.dart';

@freezed
abstract class SellerRevenue with _$SellerRevenue {
  const factory SellerRevenue({
    required RevenuePeriod period,
    required double totalRevenue,
    required String currency,
    required int soldCount,
    required double averagePrice,
    required DateTime startDate,
    required DateTime endDate,
  }) = _SellerRevenue;
}