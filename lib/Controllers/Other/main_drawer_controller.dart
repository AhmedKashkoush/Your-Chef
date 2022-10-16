import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Models/Drawer/MainDrawer/main_drawer_item.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';

import '../../Core/Constants/app_translation_keys.dart';

class MainDrawerController extends GetxController {
  final MainDrawerPage page;

  MainDrawerController({required this.page});

  final List<MainDrawerItem> pages = [
    MainDrawerItem(
      name: AppTranslationKeys.homePage,
      icon: Ionicons.home_outline,
      activeIcon: Ionicons.home,
      type: MainDrawerPage.main,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.account,
      icon: Ionicons.person_circle_outline,
      activeIcon: Ionicons.person_circle,
      type: MainDrawerPage.account,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.restaurantPlaces,
      icon: Ionicons.location_outline,
      activeIcon: Ionicons.location,
      type: MainDrawerPage.map,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.security,
      icon: Ionicons.shield_outline,
      activeIcon: Ionicons.shield,
      type: MainDrawerPage.security,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.policyAndTerms,
      icon: Icons.policy_outlined,
      activeIcon: Icons.policy,
      type: MainDrawerPage.policy,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.licenses,
      icon: Ionicons.clipboard_outline,
      activeIcon: Ionicons.clipboard,
      type: MainDrawerPage.licenses,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.ads,
      icon: Icons.monetization_on_outlined,
      activeIcon: Icons.monetization_on,
      type: MainDrawerPage.ads,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.settings,
      icon: Ionicons.settings_outline,
      activeIcon: Ionicons.settings,
      type: MainDrawerPage.settings,
    ),
    MainDrawerItem(
      name: AppTranslationKeys.aboutApp,
      icon: Ionicons.information_circle_outline,
      activeIcon: Ionicons.information_circle,
      type: MainDrawerPage.about,
    ),
  ];

  void to(MainDrawerPage toPage) {
    if (page == toPage) {
      Get.back();
      return;
    }
    Get.back();
    switch (toPage) {
      case MainDrawerPage.main:
        Get.offNamed(AppRouteNames.home);
        break;
      case MainDrawerPage.map:
        break;
      case MainDrawerPage.settings:
        break;
      case MainDrawerPage.account:
        Get.offNamed(AppRouteNames.account);
        break;
      case MainDrawerPage.security:
        break;
      case MainDrawerPage.policy:
        break;
      case MainDrawerPage.about:
        break;
      case MainDrawerPage.licenses:
        break;
      case MainDrawerPage.ads:
        break;
    }
  }

  void toHome() {
    if (page == MainDrawerPage.main) {
      Get.back();
      return;
    }
    Get.back();
    Get.offNamed(AppRouteNames.home);
  }

  void toAccount() {
    if (page == MainDrawerPage.account) {
      Get.back();
      return;
    }
    Get.back();
    Get.offNamed(AppRouteNames.account);
  }

  void toRestaurantsPlaces() {
    if (page == MainDrawerPage.map) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toSecurity() {
    if (page == MainDrawerPage.security) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toPolicyAndTerms() {
    if (page == MainDrawerPage.policy) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toLicenses() {
    if (page == MainDrawerPage.licenses) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toAds() {
    if (page == MainDrawerPage.ads) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toSettings() {
    if (page == MainDrawerPage.settings) {
      Get.back();
      return;
    }
    Get.back();
  }

  void toAboutApp() {
    if (page == MainDrawerPage.about) {
      Get.back();
      return;
    }
    Get.back();
  }
}
