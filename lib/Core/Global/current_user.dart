import 'package:your_chief/Model/Models/user_model.dart';

class CurrentUser {
  static String? _token;
  static String? get token => _token;
  static UserModel? _currentUser;
  static UserModel? get currentUser => _currentUser;
  static void setCurrentUser(UserModel user) {
    _currentUser = user;
  }

  static void setToken(String token) {
    _token = token;
  }
}
