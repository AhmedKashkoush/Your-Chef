import 'package:your_chief/Model/Models/user_model.dart';

class CurrentUser {
  static String? _token;
  static String? get token => _token;
  static bool _isOnline = false;
  static bool get isOnline => _isOnline;
  static UserModel? _currentUser;
  static UserModel? get currentUser => _currentUser;
  static void setCurrentUser(UserModel user) {
    _currentUser = user;
  }

  static void setToken(String token) {
    _token = token;
  }

  static void setStatus(bool online) {
    _isOnline = online;
  }
}
