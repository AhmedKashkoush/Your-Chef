import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class AppThemes {
  static ThemeMode themeMode = ThemeMode.system;
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
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
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primarySwatch,
      accentColor: AppColors.secondary,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: AppColors.bgColorDark,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primary),
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
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.body,
    ),
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primarySwatch,
      accentColor: AppColors.secondary,
      brightness: Brightness.dark,
    ),
  );
}
