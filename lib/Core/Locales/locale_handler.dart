import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleHandler {
  static GetStorage _storage = GetStorage();
  static void setLocale(String languageCode) {
    _storage.write('locale', languageCode);
    Locale locale = Locale(languageCode);
    Get.updateLocale(locale);
  }

  static void setLocaleSystem() {
    _storage.write('locale', null);
    String languageCode = Platform.localeName;
    Locale locale = Locale(languageCode);
    Get.updateLocale(locale);
  }

  static String? getLocale() {
    String? _languageCode = _storage.read<String>('locale');
    return _languageCode;
  }
}
