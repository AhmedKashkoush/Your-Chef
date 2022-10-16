import 'package:your_chief/Model/Models/user_model.dart';

class CurrentUser {
  static String? _token;
  static String? get token => _token;
  static bool _isOnline = false;
  static bool get isOnline => _isOnline;
  static UserModel? _user;
  static UserModel? get user => _user;
  static void setCurrentUser(UserModel user) {
    _user = user;
  }

  static void deleteCurrentUser() {
    _user = null;
  }

  static void setToken(String token) {
    _token = token;
  }

  static void deleteToken() {
    _token = null;
  }

  static void setStatus(bool online) {
    _isOnline = online;
  }
}
