import 'package:get/get.dart';
import 'package:your_chief/Core/Bindings/Auth/auth_bindings.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Screens/Auth/auth_screen.dart';

class AppRoutes {
  static const String initialRoute = AppRouteNames.auth;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouteNames.auth,
      page: () => const AuthScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRouteNames.registerVerify,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: AppRouteNames.forgetPassword,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: AppRouteNames.resetPassword,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: AppRouteNames.home,
      page: () => const AuthScreen(),
    ),
  ];
}
