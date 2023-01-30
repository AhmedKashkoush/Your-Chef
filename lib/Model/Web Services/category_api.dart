import 'package:your_chief/Core/Constants/api_body_keys.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/api_links.dart';
import 'package:your_chief/Core/Helpers/Web/api_helper.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Model/Models/category_model.dart';
import 'package:your_chief/Model/Repository/Structure/category_structure.dart';

class CategoryApi implements ICategoryRepository {
  final ApiHelper _helper = ApiHelper();
  @override
  Future? getCategories(String token, [int? limit, int? page]) async {
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
        url: '${ApiLinks.categories}',
        headers: headers,
        body: body,
      );
      if (data != null) {
        if (data['status'] == 'success') {
          List categoriesData = data['data']['data'];
          List<CategoryModel> categories = categoriesData
              .map((category) => CategoryModel.fromJson(category))
              .toList();
          return categories;
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
