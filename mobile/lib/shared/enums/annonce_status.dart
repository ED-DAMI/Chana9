import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AnnonceStatus {
  @JsonValue('DRAFT')
  draft('DRAFT'),
  @JsonValue('ACTIVE')
  active('ACTIVE'),
  @JsonValue('SUSPENDED')
  suspended('SUSPENDED'),
  @JsonValue('SOLD')
  sold('SOLD'),
  @JsonValue('EXPIRED')
  expired('EXPIRED');

  final String value;
  const AnnonceStatus(this.value);

  static AnnonceStatus fromJson(String value) =>
      AnnonceStatus.values.firstWhere(
            (e) => e.value == value,
        orElse: () => AnnonceStatus.draft,
      );

  String toJson() => value;
}