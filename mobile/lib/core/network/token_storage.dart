import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ma_chana9_app/features/auth/domain/entities/user.dart';
import 'package:ma_chana9_app/features/auth/data/models/user_model.dart';

class TokenStorage {
  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _cachedUserKey = 'cached_user';
  static const String _savedPhoneKey = 'saved_phone';
  static const String _savedPasswordKey = 'saved_password';

  TokenStorage(this._storage);

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    if (refreshToken != null) {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    }
  }

  Future<void> saveCredentials({
    required String phone,
    required String password,
  }) async {
    await _storage.write(key: _savedPhoneKey, value: phone);
    await _storage.write(key: _savedPasswordKey, value: password);
  }

  Future<({String phone, String password})?> getSavedCredentials() async {
    final phone = await _storage.read(key: _savedPhoneKey);
    final password = await _storage.read(key: _savedPasswordKey);
    if (phone == null || password == null) return null;
    return (phone: phone, password: password);
  }

  Future<void> clearCredentials() async {
    await _storage.delete(key: _savedPhoneKey);
    await _storage.delete(key: _savedPasswordKey);
  }

  Future<void> saveUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      phone: user.phone,
      fullName: user.fullName,
      role: user.role,
      kycVerified: user.kycVerified,
      profilePhotoUrl: user.profilePhotoUrl,
      region: user.region,
      active: user.active,
      createdAt: user.createdAt,
    );
    await _storage.write(
      key: _cachedUserKey,
      value: jsonEncode(userModel.toJson()),
    );
  }

  Future<User?> getCachedUser() async {
    final raw = await _storage.read(key: _cachedUserKey);
    if (raw == null) return null;
    return UserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>)
        .toEntity();
  }

  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }

  Future<bool> hasToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}