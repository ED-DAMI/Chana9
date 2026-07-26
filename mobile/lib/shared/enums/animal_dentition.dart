import 'package:freezed_annotation/freezed_annotation.dart';

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

  String get displayName => switch (this) {
    AnimalDentition.milkTeeth => 'Dents de lait',
    AnimalDentition.twoTeeth => '2 dents',
    AnimalDentition.fourTeeth => '4 dents',
    AnimalDentition.sixTeeth => '6 dents',
    AnimalDentition.fullMouth => 'Bouche complète',
  };
}