import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:your_chief/Core/Themes/app_themes.dart';

class ThemeHandler {
  static GetStorage _storage = GetStorage();
  static void setTheme(ThemeMode themeMode) {
    _storage.write('themeMode', themeMode.name);
    AppThemes.themeMode = themeMode;
    Get.changeThemeMode(themeMode);
  }

  static ThemeMode getTheme() {
    String? _theme = _storage.read<String>('themeMode');
    ThemeMode _themeMode =
        _theme == null ? ThemeMode.system : ThemeMode.values.byName(_theme);
    return _themeMode;
  }
}
