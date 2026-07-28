import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ma_chana9_app/shared/enums/role.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String phone,
    String? fullName,
    required Role role,
    required bool kycVerified,
    String? profilePhotoUrl,
    String? region,
    required bool active,
    required DateTime createdAt,
  }) = _User;
}