// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => _RegisterRequestModel(
  phone: json['phone'] as String,
  password: json['password'] as String,
  fullName: json['fullName'] as String?,
  region: json['region'] as String?,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  _RegisterRequestModel instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'password': instance.password,
  'fullName': instance.fullName,
  'region': instance.region,
};
