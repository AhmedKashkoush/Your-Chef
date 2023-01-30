import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/api_body_keys.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/api_links.dart';
import 'package:your_chief/Core/Helpers/Web/api_helper.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/Model/Repository/Structure/food_structure.dart';

class FoodApi implements IFoodRepository {
  final ApiHelper _helper = ApiHelper();
  @override
  Future? getAllFoods(String token, int page, [int? limit]) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> body = {
      ApiBodyKeys.limit: limit ?? 10,
    };
    try {
      dynamic data = await _helper.postData(
        url: '${ApiLinks.allFoods}?page=$page',
        headers: headers,
        body: body,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          List foodsData = data['data']['data'];
          List<FoodModel> foods =
              foodsData.map((food) => FoodModel.fromJson(food)).toList();
          return foods;
        } else {
          return ApiMessages(data['msg']);
        }
      }
    } catch (e) {
      Get.defaultDialog(title: e.toString());
      return null;
    }
    return null;
  }

  @override
  Future? getFoodsFromRestaurant(String token, page, int restaurantId,
      [int? limit]) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> body = {
      ApiBodyKeys.limit: limit ?? 10,
      ApiBodyKeys.restaurant: restaurantId
    };
    try {
      dynamic data = await _helper.postData(
        url: '${ApiLinks.foodRestaurant}?page=$page',
        headers: headers,
        body: body,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          List<Map<String, dynamic>> foodsData = data['data']['data'];
          List<FoodModel> foods =
              foodsData.map((food) => FoodModel.fromJson(food)).toList();
          return foods;
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
  Future? getFoodsWithCategory(String token, page, int categoryId,
      [int? limit]) async {
    Map<String, String> headers = {
      'X-Authorization': ApiHeaders.apiKey,
      'Accept': ApiHeaders.accept,
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> body = {
      ApiBodyKeys.limit: limit ?? 10,
      ApiBodyKeys.category: categoryId
    };
    try {
      dynamic data = await _helper.postData(
        url: '${ApiLinks.foodWithCategory}?page=$page',
        headers: headers,
        body: body,
      );
      // Get.defaultDialog(title: data.toString());
      if (data != null) {
        if (data['status'] == 'success') {
          List<Map<String, dynamic>> foodsData = data['data']['data'];
          List<FoodModel> foods =
              foodsData.map((food) => FoodModel.fromJson(food)).toList();
          return foods;
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
