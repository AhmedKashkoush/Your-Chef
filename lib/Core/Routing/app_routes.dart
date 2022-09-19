import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Bindings/Auth/auth_bindings.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Screens/Auth/auth_screen.dart';
import 'package:your_chief/View/Screens/Auth/verify_account_screen.dart';
import 'package:your_chief/View/Screens/Error/page_not_found_screen.dart';
import 'package:your_chief/View/Screens/OnBoarding/onboarding_screen.dart';

class AppRoutes {
  static const String initialRoute = AppRouteNames.onBoarding;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouteNames.onBoarding,
      page: () => const OnBoardingScreen(),
      //binding: AuthBindings(),
    ),
    GetPage(
      name: AppRouteNames.auth,
      page: () => const AuthScreen(),
      binding: AuthBindings(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: AppRouteNames.addProfilePhoto,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: AppRouteNames.registerVerify,
      page: () => const VerifyAccountScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
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
    GetPage(
      name: AppRouteNames.error,
      page: () => const PageNotFoundScreen(),
      transition: Transition.upToDown,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
