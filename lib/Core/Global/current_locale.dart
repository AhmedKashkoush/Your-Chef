import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentLocale {
  static Locale? _locale = Get.deviceLocale;
  static Locale? get locale => _locale;

  static void setLocale(Locale locale) {
    _locale = locale;
  }
}
