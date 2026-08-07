import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/revenue_point.dart';

part 'revenue_point_model.freezed.dart';
part 'revenue_point_model.g.dart';

@freezed
abstract class RevenuePointModel with _$RevenuePointModel {
  const RevenuePointModel._();

  const factory RevenuePointModel({
    required String date,
    required double revenue,
    @JsonKey(name: 'sold_count') required int soldCount,
  }) = _RevenuePointModel;

  factory RevenuePointModel.fromJson(Map<String, dynamic> json) =>
      _$RevenuePointModelFromJson(json);

  RevenuePoint toEntity() => RevenuePoint(
    date: DateTime.parse(date),
    revenue: revenue,
    soldCount: soldCount,
  );
}