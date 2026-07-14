import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'auth_result.freezed.dart';

@freezed
abstract class AuthResult with _$AuthResult {
  const factory AuthResult({
    required String accessToken,
    String? refreshToken,
    required int accessTokenExpiresIn,
    int? refreshTokenExpiresIn,
    required User user,
  }) = _AuthResult;
}
