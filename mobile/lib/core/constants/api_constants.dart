class ApiConstants {
  static const String ip='192.168.1.158';
  static const String baseUrl = 'http://$ip:8080/api/v1';
  static const String baseUrl_photos = 'http://$ip/uploads';
  static const String login = '/auth/login';
  static const String verifyOtp = '/auth/verify-otp';
  static const String annonces = '/annonces';
  static const String sequestres = '/sequestres';
  static const String messages = '/messages';
  static const String register = '/api/v1/auth/register';
  static const String forgotPassword = '/api/v1/auth/forgot-password';
  static const String logout = '/api/v1/auth/logout';
  static const String refresh = '/api/v1/auth/refresh';
  static const String revokeAll = '/api/v1/auth/revoke-all';
  static const String me = '/api/v1/users/me';
  static const String changePassword = '/api/v1/users/me/password';
  static const String avatar = '/api/v1/users/me/avatar';
  static const String kyc = '/api/v1/users/me/kyc';
  static const String sessions = '/api/v1/users/me/sessions';
}
