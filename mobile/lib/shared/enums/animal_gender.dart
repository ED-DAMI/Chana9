import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AnimalGender {
  @JsonValue('MALE')
  male('MALE'),
  @JsonValue('FEMALE')
  female('FEMALE');

  final String value;
  const AnimalGender(this.value);

  static AnimalGender fromJson(String value) =>
      AnimalGender.values.firstWhere(
            (e) => e.value == value,
        orElse: () => AnimalGender.male,
      );

  String toJson() => value;
}

extension AnimalGenderExtension on AnimalGender {
  static AnimalGender? fromString(String value) {
    switch (value.toUpperCase()) {
      case 'MALE':
      case 'MÂLE':
        return AnimalGender.male;
      case 'FEMALE':
      case 'FEMELLE':
        return AnimalGender.female;
      default:
        return null;
    }
  }
}