import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> put(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> patch(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

  Future<Response> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) =>
      _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
}