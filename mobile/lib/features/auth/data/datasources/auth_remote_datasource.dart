import 'package:ma_chana9_app/core/network/dio_client.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> refreshToken(String refreshToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  static const String _base = '/api/v1/auth';

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await dioClient.post(
      '$_base/login',
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthResponseModel> refreshToken(String refreshToken) async {
    final response = await dioClient.post(
      '$_base/refresh',
      data: {'refreshToken': refreshToken},
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
