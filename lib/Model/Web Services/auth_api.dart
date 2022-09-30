import 'dart:io';
import 'package:your_chief/Core/Constants/api_body_keys.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/api_links.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Helpers/Web/api_helper.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/Model/Repositories/Structure/auth_structure.dart';

class AuthApi implements IAuthRepository {
  final ApiHelper _helper = ApiHelper();
  @override
  Future login(String email, String password) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.password: password,
    };
    dynamic data = await _helper.postData(
      url: ApiLinks.login,
      body: body,
      headers: ApiHeaders.authHeaders,
    );
    if (data != null) {
      if (data['status'] == 'success') {
        Map<String, dynamic> userData = data['data'];
        String token = data['data']['token'];
        UserModel user = UserModel.fromJson(userData);
        CurrentUser.setCurrentUser(user);
        CurrentUser.setToken(token);
        return user;
      }
    }
    return null;
  }

  @override
  Future register(String name, String phone, String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future sendOtp(String email) {
    throw UnimplementedError();
  }

  @override
  Future uploadPhoto(String email, File photo) {
    throw UnimplementedError();
  }

  @override
  Future verifyOtp(String email, String code) {
    throw UnimplementedError();
  }
}
