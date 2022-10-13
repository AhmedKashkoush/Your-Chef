import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Global/current_locale.dart';
import 'package:your_chief/Core/Locales/app_translations.dart';
import 'package:your_chief/Core/Routing/app_routes.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Services/connectivity_service.dart';
import 'package:your_chief/Core/Themes/app_themes.dart';
import 'package:your_chief/View/Screens/Error/page_not_found_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.light,
  ));
  await Get.putAsync(() => ConnectivityService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your Chef',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: AppThemes.themeMode,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initialRoute,
      unknownRoute: GetPage(
        name: AppRouteNames.error,
        page: () => const PageNotFoundScreen(),
        transition: Transition.upToDown,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
      locale: CurrentLocale.locale,
      translations: AppTranslations(),
      fallbackLocale: Locale('en'),
    );
  }
}
