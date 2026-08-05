import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request_model.freezed.dart';
part 'change_password_request_model.g.dart';

@freezed
abstract class ChangePasswordRequestModel with _$ChangePasswordRequestModel {
  const factory ChangePasswordRequestModel({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePasswordRequestModel;

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestModelFromJson(json);
}