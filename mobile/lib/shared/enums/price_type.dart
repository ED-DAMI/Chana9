import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'value')
enum PriceType {
  @JsonValue('FIXED')
  fixed('FIXED'),
  @JsonValue('PER_HEAD')
  perHead('PER_HEAD'),
  @JsonValue('PER_KG')
  perKg('PER_KG');

  final String value;
  const PriceType(this.value);

  static PriceType fromJson(String? value) {
    return PriceType.values.firstWhere(
          (e) => e.value == value,
      orElse: () => PriceType.fixed,
    );
  }

  String get displayName => switch (this) {
    PriceType.fixed => 'Prix fixe',
    PriceType.perHead => 'Par tête',
    PriceType.perKg => 'Par kg',
  };
}