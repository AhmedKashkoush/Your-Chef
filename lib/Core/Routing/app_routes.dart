import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Bindings/Account/account_binding.dart';
import 'package:your_chief/Core/Bindings/Auth/add_profile_photo_binding.dart';
import 'package:your_chief/Core/Bindings/Auth/auth_bindings.dart';
import 'package:your_chief/Core/Bindings/Auth/forgot_password_binding.dart';
import 'package:your_chief/Core/Bindings/Auth/reset_password_binding.dart';
import 'package:your_chief/Core/Bindings/Auth/verification_method_binding.dart';
import 'package:your_chief/Core/Bindings/Auth/verify_account_binding.dart';
import 'package:your_chief/Core/Bindings/Home/Cart/cart_binding.dart';
import 'package:your_chief/Core/Bindings/Home/Food%20Details/food_details_binding.dart';
import 'package:your_chief/Core/Bindings/Home/search_binding.dart';
import 'package:your_chief/Core/Bindings/Onboarding/onboarding_binding.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Screens/Account/account_screen.dart';
import 'package:your_chief/View/Screens/Auth/add_profile_photo_screen.dart';
import 'package:your_chief/View/Screens/Auth/auth_screen.dart';
import 'package:your_chief/View/Screens/Auth/forgot_password_screen.dart';
import 'package:your_chief/View/Screens/Auth/reset_password_screen.dart';
import 'package:your_chief/View/Screens/Auth/verification_method_screen.dart';
import 'package:your_chief/View/Screens/Auth/verify_account_screen.dart';
import 'package:your_chief/View/Screens/Auth/verify_email_screen.dart';
import 'package:your_chief/View/Screens/Home/Cart/cart_screen.dart';
import 'package:your_chief/View/Screens/Home/Food%20Details/food_details_screen.dart';
import 'package:your_chief/View/Screens/Home/main_screen.dart';
import 'package:your_chief/View/Screens/Home/search_screen.dart';
import 'package:your_chief/View/Screens/OnBoarding/onboarding_screen.dart';
import 'package:your_chief/View/Screens/Restaurant/restaurant_screen.dart';

import '../../View/Screens/Auth/account_verified_screen.dart';
import '../Bindings/Auth/verify_email_binding.dart';
import '../Bindings/Home/main_screen_binding.dart';
import '../Bindings/Restaurant/restaurant_screen_binding.dart';

class AppRoutes {
  static const String initialRoute = AppRouteNames.onBoarding;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouteNames.onBoarding,
      page: () => const OnBoardingScreen(),
      binding: OnboardingBinding(),
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
      page: () => const AddProfilePhotoScreen(),
      binding: AddProfilePhotoBindings(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.verificationMethod,
      page: () => const VerificationMethodScreen(),
      binding: VerificationMethodBinding(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: AppRouteNames.registerVerify,
      page: () => const VerifyAccountScreen(),
      binding: VerifyAccountBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.verificationComplete,
      page: () => const AccountVerifiedScreen(),
      transition: Transition.upToDown,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
      transition: Transition.downToUp,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.home,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
      transition: Transition.fade,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.cart,
      page: () => const CartScreen(),
      binding: CartBinding(),
      transition: Transition.upToDown,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.foodDetails,
      page: () => const FoodDetailsScreen(),
      binding: FoodDetailsBinding(),
      transition: Transition.fade,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.homeSearch,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 700),
      opaque: false,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: AppRouteNames.restaurant,
      page: () => const RestaurantScreen(),
      binding: RestaurantScreenBinding(),
      transition: Transition.fadeIn,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.account,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.verifyEmail,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
    ),
    GetPage(
      name: AppRouteNames.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
      transition: Transition.rightToLeft,
      curve: Curves.slowMiddle,
    ),
  ];
}
