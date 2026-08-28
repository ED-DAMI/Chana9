part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.passwordSuccess() = _PasswordSuccess;
  const factory AuthState.failure(String message) = _Failure;
  const factory AuthState.otpSent() = _OtpSent;
  const factory AuthState.otpVerified() = _OtpVerified;
  const factory AuthState.resetSuccess() = _ResetSuccess;
}