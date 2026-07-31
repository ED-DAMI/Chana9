import 'package:dio/dio.dart';
import 'package:ma_chana9_app/core/network/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final void Function() onUnauthorized;

  AuthInterceptor({
    required this.tokenStorage,
    required this.onUnauthorized,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await tokenStorage.clearTokens();
      onUnauthorized();
    }
    handler.next(err);
  }
}