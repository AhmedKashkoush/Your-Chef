import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Locales/app_translations.dart';
import 'package:your_chief/Core/Routing/app_routes.dart';
import 'package:your_chief/Core/Themes/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your Chief',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      themeMode: AppThemes.themeMode,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      fallbackLocale: Locale('en'),
    );
  }
}
