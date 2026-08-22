import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_summary.freezed.dart';

@freezed
abstract class SellerSummary with _$SellerSummary {
  const factory SellerSummary({
    required String id,
    String? fullName,
    String? avatarUrl,
    String? region,
  }) = _SellerSummary;
}