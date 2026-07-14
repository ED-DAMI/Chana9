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
  kycSubmittedAt: json['kycSubmittedAt'] == null
      ? null
      : DateTime.parse(json['kycSubmittedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'role': instance.role,
      'kycVerified': instance.kycVerified,
      'kycSubmittedAt': instance.kycSubmittedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.buyer: 'BUYER',
  Role.seller: 'SELLER',
  Role.admin: 'ADMIN',
};
