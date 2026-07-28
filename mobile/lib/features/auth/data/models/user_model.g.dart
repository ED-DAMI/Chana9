// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  phone: json['phone'] as String,
  fullName: json['fullName'] as String?,
  role: $enumDecode(_$RoleEnumMap, json['role']),
  kycVerified: json['kycVerified'] as bool,
  profilePhotoUrl: json['profilePhotoUrl'] as String?,
  region: json['region'] as String?,
  active: json['active'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'role': instance.role,
      'kycVerified': instance.kycVerified,
      'profilePhotoUrl': instance.profilePhotoUrl,
      'region': instance.region,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.buyer: 'BUYER',
  Role.seller: 'SELLER',
  Role.admin: 'ADMIN',
};
