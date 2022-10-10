class ApiLinks {
  static const String host = 'http://192.168.1.6:8000';
  static const String base = '$host/api/v1';
  static const String login = '$base/users/login';
  static const String register = '$base/users/register';
  static const String uploadProfilePhoto = '$base/users/profile-photo/upload';
  static const String deleteProfilePhoto = '$base/users/profile-photo/delete';
  static const String allProfilePhotos = '$base/users/profile-photo/all';
  static const String sendOtp = '$base/users/send-code';
  static const String verifyOtp = '$base/users/verify';
  static const String sendOtpMail = '$base/users/send-code-mail';
  static const String verifyOtpMail = '$base/users/verify-email';
  static const String resetPassword = '$base/users/reset-password';
}
