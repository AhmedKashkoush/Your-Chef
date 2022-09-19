import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IntroductionScreen(
        scrollPhysics: AlwaysScrollableScrollPhysics(),
        curve: Curves.fastLinearToSlowEaseIn,
        showBackButton: true,
        showNextButton: true,
        next: Text(
          AppTranslationKeys.next.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        nextStyle: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        back: Text(
          AppTranslationKeys.back.tr,
        ),
        skip: Text(
          AppTranslationKeys.skip.tr,
        ),
        backStyle: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            primary: Theme.of(context).primaryColor),
        skipStyle: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          primary: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).primaryColor,
          activeSize: Size(20, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          color: isDark
              ? AppColors.dotColorDark
              : Theme.of(context).iconTheme.color!,
        ),
        done: Text(
          AppTranslationKeys.getStarted.tr,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        doneStyle: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onDone: () {
          Get.offNamed(AppRouteNames.auth);
        },
        pages: [
          PageViewModel(
            title: 'Page 1',
            body: 'Body 1',
            useRowInLandscape: true,
          ),
          PageViewModel(
            title: 'Page 2',
            body: 'Body 2',
            useRowInLandscape: true,
          ),
          PageViewModel(
            title: 'Page 3',
            body: 'Body 3',
            useRowInLandscape: true,
          ),
          PageViewModel(
            title: 'Page 4',
            body: 'Body 4',
            useRowInLandscape: true,
          ),
        ],
      ),
    );
  }
}
