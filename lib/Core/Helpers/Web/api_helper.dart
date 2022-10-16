import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';

class ApiHelper extends GetConnect {
  Future getData({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await get(
        url,
        query: query,
        headers: headers,
        contentType: ApiHeaders.accept,
      );
      dynamic _data = response.body;
      return _data;
    } catch (e) {
      return null;
    }
  }

  Future postData({
    required String url,
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      Response response = await post(
        url,
        body,
        headers: headers,
        contentType: ApiHeaders.accept,
      );
      dynamic _data = response.body;
      return _data;
    } catch (e) {
      return null;
    }
  }

  Future postFile({
    required String url,
    required String fileKey,
    Map<String, String>? headers,
    required Map<String, dynamic> body,
    required File file,
  }) async {
    try {
      final MultipartFile multipartFile =
          MultipartFile(file, filename: basename(file.path));
      body[fileKey] = multipartFile;
      final FormData form = FormData(body);
      Response response = await post(url, form, headers: headers);
      dynamic data = response.body;
      return data;
    } catch (e) {
      return null;
    }
  }
}
