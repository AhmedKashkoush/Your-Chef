import 'dart:io';
import 'package:your_chief/Core/Constants/api_body_keys.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/api_links.dart';
import 'package:your_chief/Core/Global/current_locale.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Helpers/Web/api_helper.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/Model/Repository/Structure/auth_structure.dart';

class AuthApi implements IAuthRepository {
  final ApiHelper _helper = ApiHelper();
  @override
  Future login(String email, String password) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.password: password,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
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
          CurrentUser.setStatus(true);
          return user;
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future register(String name, int gender, String phone, String email,
      String password) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.name: name,
      ApiBodyKeys.gender: gender,
      ApiBodyKeys.phone: phone,
      ApiBodyKeys.email: email,
      ApiBodyKeys.password: password,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.register,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          Map<String, dynamic> userData = data['data'];
          UserModel user = UserModel.fromJson(userData);
          return user;
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future sendOtp(String email, String via) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.via: via,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.sendOtp,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          return 'code sent';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future uploadPhoto(String email, File photo) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postFile(
        url: ApiLinks.uploadProfilePhoto,
        body: body,
        headers: ApiHeaders.authHeaders,
        file: photo,
        fileKey: 'photo',
      );
      if (data != null) {
        if (data['status'] == 'success') {
          // Map<String, dynamic> userData = data['data'];
          // UserModel user = UserModel.fromJson(userData);
          return 'success';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future verifyOtp(String email, String code) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.code: code,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.verifyOtp,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          // Map<String, dynamic> userData = data['data'];
          // UserModel user = UserModel.fromJson(userData);
          return 'Code matched';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future changePassword(String email, String newPassword) async {
    return null;
  }

  @override
  Future resetPassword(String email, String newPassword) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.password: newPassword,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.resetPassword,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          return 'password reset';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future sendOtpMail(String email) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.sendOtpMail,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          return 'code sent';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future verifyOtpMail(String email, String code) async {
    final Map<String, dynamic> body = {
      ApiBodyKeys.email: email,
      ApiBodyKeys.code: code,
      ApiBodyKeys.locale: CurrentLocale.locale?.languageCode
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.verifyOtpMail,
        body: body,
        headers: ApiHeaders.authHeaders,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          return 'Code matched';
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
