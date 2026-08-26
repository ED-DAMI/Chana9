class ApiConstants {
  static const String ip='192.168.1.145';
  static const String baseUrl = 'http://$ip:8080/api/v1';
  static const String baseUrl_photos = 'http://$ip/uploads';
  static const String login = '/auth/login';
  static const String verifyOtp = '/auth/verify-otp';
  static const String annonces = '/annonces';
  static const String sequestres = '/sequestres';
  static const String messages = '/messages';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';
  static const String revokeAll = '/api/v1/auth/revoke-all';
  static const String me = '/users/me';
  static const String changePassword = '/users/me/password';
  static const String avatar = '/users/me/avatar';
  static const String kyc = '/users/me/kyc';
  static const String sessions = '/users/me/sessions';
}
