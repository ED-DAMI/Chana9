import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@JsonEnum(valueField: 'value')
enum AnimalDentition {
  @JsonValue('MILK_TEETH')
  milkTeeth('MILK_TEETH'),
  @JsonValue('TWO_TEETH')
  twoTeeth('TWO_TEETH'),
  @JsonValue('FOUR_TEETH')
  fourTeeth('FOUR_TEETH'),
  @JsonValue('SIX_TEETH')
  sixTeeth('SIX_TEETH'),
  @JsonValue('FULL_MOUTH')
  fullMouth('FULL_MOUTH');

  final String value;
  const AnimalDentition(this.value);

  static AnimalDentition fromJson(String? value) {
    return AnimalDentition.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AnimalDentition.milkTeeth,
    );
  }

  String localizedDisplayName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      AnimalDentition.milkTeeth => l10n.milkTeeth,
      AnimalDentition.twoTeeth => l10n.twoTeeth,
      AnimalDentition.fourTeeth => l10n.fourTeeth,
      AnimalDentition.sixTeeth => l10n.sixTeeth,
      AnimalDentition.fullMouth => l10n.fullMouth,
    };
  }
}
