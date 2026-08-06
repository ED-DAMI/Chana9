// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_revenue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SellerRevenueModel _$SellerRevenueModelFromJson(Map<String, dynamic> json) =>
    _SellerRevenueModel(
      period: json['period'] as String,
      totalRevenue: (json['total_revenue'] as num).toDouble(),
      currency: json['currency'] as String,
      soldCount: (json['sold_count'] as num).toInt(),
      averagePrice: (json['average_price'] as num).toDouble(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$SellerRevenueModelToJson(_SellerRevenueModel instance) =>
    <String, dynamic>{
      'period': instance.period,
      'total_revenue': instance.totalRevenue,
      'currency': instance.currency,
      'sold_count': instance.soldCount,
      'average_price': instance.averagePrice,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
