part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkStatus() = _CheckStatus;
  const factory AuthEvent.login({
    required String phone,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String phone,
    required String password,
    String? fullName,
    String? region,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;
}