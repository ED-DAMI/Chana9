import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum Role {
  @JsonValue('USER')
  user('USER'),
  @JsonValue('USER_PREMIUM')
  userPremium('USER_PREMIUM'),
  @JsonValue('ADMIN')
  admin('ADMIN');

  final String value;
  const Role(this.value);

  static Role fromJson(String value) => Role.values.firstWhere(
        (e) => e.value == value,
    orElse: () => Role.user,
  );

  String toJson() => value;
}