import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_result.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const AuthResponseModel._();

  const factory AuthResponseModel({
    String? accessToken,
    String? refreshToken,
    int? accessTokenExpiresIn,
    int? refreshTokenExpiresIn,
    UserModel? user,
    String? message,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  AuthResult toEntity() => AuthResult(
        accessToken: accessToken!,
        refreshToken: refreshToken,
        accessTokenExpiresIn: accessTokenExpiresIn!,
        refreshTokenExpiresIn: refreshTokenExpiresIn,
        user: user!.toEntity(),
      );
}
