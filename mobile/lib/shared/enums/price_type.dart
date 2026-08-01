import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String localizedDisplayName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      PriceType.fixed => l10n.fixedPrice,
      PriceType.perHead => l10n.perHead,
      PriceType.perKg => l10n.perKg,
    };
  }
}
