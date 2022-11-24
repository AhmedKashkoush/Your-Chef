import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Models/OnBoarding/onboarding_page.dart';
import 'package:your_chief/View/Widgets/Onboarding/onboarding_view.dart';

class OnboardingController extends GetxController {
  final Duration _duration = Duration(milliseconds: 500);
  final Curve _curve = Curves.easeInOut;
  late final PageController pageController;
  final List<OnBoardingView> pages = [
    OnBoardingView(
      page: OnboardingPage(
        image: AppImages.onboarding1,
        title: AppTranslationKeys.onBoardingTitle1.tr,
        body: AppTranslationKeys.onBoardingBody1.tr,
      ),
    ),
    OnBoardingView(
      page: OnboardingPage(
        image: AppImages.onboarding2,
        title: AppTranslationKeys.onBoardingTitle2.tr,
        body: AppTranslationKeys.onBoardingBody2.tr,
      ),
    ),
    OnBoardingView(
      page: OnboardingPage(
        image: AppImages.onboarding3,
        title: AppTranslationKeys.onBoardingTitle3.tr,
        body: AppTranslationKeys.onBoardingBody3.tr,
      ),
    ),
  ];

  int _currentPage = 0;

  int get currentPage => _currentPage;

  bool get isFirst => currentPage == pages.indexOf(pages.first);
  bool get isLast => currentPage == pages.indexOf(pages.last);

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(() {
      if (_currentPage != pageController.page!.toInt()) {
        _currentPage = pageController.page!.toInt();
        update();
      }
    });
    super.onInit();
  }

  void next() {
    if (isLast) return;
    pageController.nextPage(duration: _duration, curve: _curve);
    update();
  }

  void back() {
    if (isFirst) return;
    pageController.previousPage(duration: _duration, curve: _curve);
    update();
  }

  void skip() {
    if (isLast) return;
    pageController.animateToPage(
      pages.indexOf(pages.last),
      duration: _duration,
      curve: _curve,
    );
    update();
  }

  void toPage(int index) {
    if (currentPage == index) return;
    pageController.animateToPage(
      index,
      duration: _duration,
      curve: _curve,
    );
    update();
  }

  void getStarted() {
    Get.offNamed(AppRouteNames.auth);
  }
}
