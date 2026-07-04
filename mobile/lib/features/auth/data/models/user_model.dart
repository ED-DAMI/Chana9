import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class UserModel {
  final String id;
  final String phone;
  final String fullName;
  final String role;
  final bool kycVerified;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.kycVerified,
    required this.createdAt,
  });
}
