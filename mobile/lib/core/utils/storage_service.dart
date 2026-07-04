import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) => _storage.write(key: 'auth_token', value: token);

  Future<String?> readToken() => _storage.read(key: 'auth_token');

  Future<void> clearToken() => _storage.delete(key: 'auth_token');
}
