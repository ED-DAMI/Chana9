import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seller_revenue.dart';
import '../../domain/entities/revenue_period.dart';

part 'seller_revenue_model.freezed.dart';
part 'seller_revenue_model.g.dart';

@freezed
abstract class SellerRevenueModel with _$SellerRevenueModel {
  const SellerRevenueModel._();

  const factory SellerRevenueModel({
    required String period,
    @JsonKey(name: 'total_revenue') required double totalRevenue,
    required String currency,
    @JsonKey(name: 'sold_count') required int soldCount,
    @JsonKey(name: 'average_price') required double averagePrice,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
  }) = _SellerRevenueModel;

  factory SellerRevenueModel.fromJson(Map<String, dynamic> json) =>
      _$SellerRevenueModelFromJson(json);

  SellerRevenue toEntity() => SellerRevenue(
    period: RevenuePeriod.values.firstWhere(
          (e) => e.value == period,
      orElse: () => RevenuePeriod.month,
    ),
    totalRevenue: totalRevenue,
    currency: currency,
    soldCount: soldCount,
    averagePrice: averagePrice,
    startDate: DateTime.parse(startDate),
    endDate: DateTime.parse(endDate),
  );
}