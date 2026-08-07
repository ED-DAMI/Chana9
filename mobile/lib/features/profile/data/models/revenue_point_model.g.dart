// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevenuePointModel _$RevenuePointModelFromJson(Map<String, dynamic> json) =>
    _RevenuePointModel(
      date: json['date'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      soldCount: (json['sold_count'] as num).toInt(),
    );

Map<String, dynamic> _$RevenuePointModelToJson(_RevenuePointModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'revenue': instance.revenue,
      'sold_count': instance.soldCount,
    };
