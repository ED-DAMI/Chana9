import 'package:ma_chana9_app/core/constants/api_constants.dart';
import 'package:ma_chana9_app/core/network/dio_client.dart';
import '../models/change_password_request_model.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/logout_request_model.dart';
import '../models/register_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);
  Future<AuthResponseModel> refreshToken(String refreshToken);
  Future<void> logout(String refreshToken);
  Future<void> revokeAll();
  Future<void> changePassword(ChangePasswordRequestModel request);
  Future<void> requestPasswordReset(String phone);
  Future<void> verifyOtp(String phone, String otp);
  Future<void> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;
  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await dioClient.post(
      ApiConstants.login,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await dioClient.post(
      ApiConstants.register,
      data: request.toJson(),
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthResponseModel> refreshToken(String refreshToken) async {
    final response = await dioClient.post(
      ApiConstants.refresh,
      data: {'refreshToken': refreshToken},
    );
    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout(String refreshToken) async {
    await dioClient.post(
      ApiConstants.logout,
      data: LogoutRequestModel(refreshToken: refreshToken).toJson(),
    );
  }

  @override
  Future<void> revokeAll() async {
    await dioClient.post(ApiConstants.revokeAll);
  }

  @override
  Future<void> changePassword(ChangePasswordRequestModel request) async {
    await dioClient.put(
      ApiConstants.changePassword,
      data: request.toJson(),
    );
  }

  @override
  Future<void> requestPasswordReset(String phone) async {
    await dioClient.post(
      ApiConstants.forgotPassword,
      data: {'phone': phone},
    );
  }

  @override
  Future<void> verifyOtp(String phone, String otp) async {
    await dioClient.post(
      ApiConstants.verifyOtp,
      data: {'phone': phone, 'otp': otp},
    );
  }

  @override
  Future<void> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    await dioClient.post(
      ApiConstants.forgotPassword,
      data: {
        'phone': phone,
        'otp': otp,
        'newPassword': newPassword,
      },
    );
  }
}