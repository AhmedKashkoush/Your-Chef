import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class AppThemes {
  static ThemeMode themeMode = ThemeMode.light;
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline5: TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w900,
        color: AppColors.primary,
        letterSpacing: 1.5,
      ),
      bodyText1: TextStyle(
        color: AppColors.primary,
      ),
      bodyText2: TextStyle(
        color: AppColors.body,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.body,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: const TextStyle(
        color: AppColors.body,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelStyle: const TextStyle(
        color: AppColors.secondary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelColor: AppColors.secondary,
      unselectedLabelColor: AppColors.body,
    ),
    splashFactory: InkRipple.splashFactory,
    highlightColor: Color.fromARGB(0, 31, 23, 23),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primarySwatch,
      accentColor: AppColors.secondary,
      brightness: Brightness.light,
    ),
  );
}
