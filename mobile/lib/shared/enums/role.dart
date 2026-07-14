import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum Role {
  @JsonValue('BUYER')
  buyer('BUYER'),
  @JsonValue('SELLER')
  seller('SELLER'),
  @JsonValue('ADMIN')
  admin('ADMIN');

  final String value;
  const Role(this.value);

  static Role fromJson(String value) => Role.values.firstWhere(
        (e) => e.value == value,
    orElse: () => Role.buyer,
  );

  String toJson() => value;
}