import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'dio_client.dart';

class DioClientFactory {

  static const String _baseUrl = ApiConstants.baseUrl;
  static const String _tokenKey = 'access_token';

  static DioClient create(
      FlutterSecureStorage secureStorage, {
        required void Function() onUnauthorized,
      }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorage.read(key: _tokenKey);
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            await secureStorage.deleteAll();
            onUnauthorized();
          }
          handler.next(error);
        },
      ),
    );

    assert(() {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ));
      return true;
    }());

    return DioClient(dio);
  }
}