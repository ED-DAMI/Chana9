import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/role.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String phone,
    String? fullName,
    required Role role,
    required bool kycVerified,
    DateTime? kycSubmittedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  User toEntity() => User(
        id: id,
        phone: phone,
        fullName: fullName,
        role: role,
        kycVerified: kycVerified,
        kycSubmittedAt: kycSubmittedAt,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
