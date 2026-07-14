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