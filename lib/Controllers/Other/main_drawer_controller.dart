import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';

class MainDrawerController extends GetxController {
  final MainDrawerPage page;

  MainDrawerController({required this.page});

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
