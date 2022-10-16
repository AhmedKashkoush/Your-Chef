import 'package:your_chief/Core/Constants/api_body_keys.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/api_links.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/Model/Repository/Structure/user_structure.dart';

import '../../Core/Helpers/Web/api_helper.dart';

class UserApi implements IUserRepository {
  final ApiHelper _helper = ApiHelper();
  @override
  Future? deleteUser(String token) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    try {
      dynamic data = await _helper.getData(
        url: ApiLinks.deleteUser,
        headers: headers,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          CurrentUser.deleteCurrentUser();
          CurrentUser.deleteToken();
          CurrentUser.setStatus(false);
          return data['msg'];
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
  Future? editUser(String token, String name, int gender) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> body = {
      ApiBodyKeys.name: name,
      ApiBodyKeys.gender: gender,
    };
    try {
      dynamic data = await _helper.postData(
        url: ApiLinks.currentUser,
        headers: headers,
        body: body,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          Map<String, dynamic> userData = data['data'];
          UserModel user = UserModel.fromJson(userData);
          CurrentUser.setCurrentUser(user);
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
  Future? getUser(String token) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    try {
      dynamic data = await _helper.getData(
        url: ApiLinks.currentUser,
        headers: headers,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          Map<String, dynamic> userData = data['data'];
          UserModel user = UserModel.fromJson(userData);
          CurrentUser.setCurrentUser(user);
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
  Future? logout(String token) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    try {
      dynamic data = await _helper.getData(
        url: ApiLinks.logout,
        headers: headers,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          CurrentUser.deleteCurrentUser();
          CurrentUser.deleteToken();
          CurrentUser.setStatus(false);
          return data['msg'];
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
  Future? setOnline(String token) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    try {
      dynamic data = await _helper.getData(
        url: ApiLinks.setOnline,
        headers: headers,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          CurrentUser.setStatus(true);
          return data['msg'];
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
