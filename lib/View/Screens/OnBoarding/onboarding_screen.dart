import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Onboarding/onboarding_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/AppBars/transparent_app_bar.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';
import 'package:your_chief/View/Widgets/Onboarding/onboarding_dot.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Scaffold(
        appBar: TransparentAppBar(
          actions: [
            if (!controller.isLast)
              TextButton(
                onPressed: controller.skip,
                child: Text(
                  AppTranslationKeys.skip.tr,
                ),
              ),
          ],
        ),
        body: PageView(
          controller: controller.pageController,
          children: controller.pages,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          child: controller.isLast
              ? PrimaryButton(
                  text: AppTranslationKeys.getStarted.tr,
                  onPressed: controller.getStarted,
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: controller.isFirst
                          ? const SizedBox()
                          : OutlinedButton(
                              onPressed: controller.back,
                              child: Icon(Icons.adaptive.arrow_back),
                              style: OutlinedButton.styleFrom(
                                primary: AppColors.secondary,
                                side: BorderSide(
                                  color: AppColors.secondary,
                                ),
                                shape: const CircleBorder(),
                              ),
                            ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.pages.map(
                          (page) {
                            int index = controller.pages.indexOf(page);
                            return OnboardingDot(
                              selected: controller.currentPage == index,
                              onTap: () {
                                controller.toPage(index);
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.next,
                        child: Icon(
                          Icons.adaptive.arrow_forward,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
    // return Scaffold(
    //   body: IntroductionScreen(
    //     scrollPhysics: AlwaysScrollableScrollPhysics(),
    //     curve: Curves.fastLinearToSlowEaseIn,
    //     showBackButton: true,
    //     showNextButton: true,
    //     next: Text(
    //       AppTranslationKeys.next.tr,
    //       style: const TextStyle(
    //         color: Colors.white,
    //         fontSize: 20,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     nextStyle: ElevatedButton.styleFrom(
    //       padding: const EdgeInsets.symmetric(vertical: 12),
    //       primary: Theme.of(context).primaryColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(14),
    //       ),
    //     ),
    //     back: Text(
    //       AppTranslationKeys.back.tr,
    //     ),
    //     skip: Text(
    //       AppTranslationKeys.skip.tr,
    //     ),
    //     backStyle: TextButton.styleFrom(
    //         padding: const EdgeInsets.symmetric(vertical: 12),
    //         primary: Theme.of(context).primaryColor),
    //     skipStyle: OutlinedButton.styleFrom(
    //       padding: const EdgeInsets.symmetric(vertical: 12),
    //       primary: Theme.of(context).colorScheme.secondary,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(14),
    //       ),
    //       textStyle: const TextStyle(
    //         color: Colors.white,
    //         fontSize: 20,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     dotsDecorator: DotsDecorator(
    //       activeColor: Theme.of(context).primaryColor,
    //       activeSize: Size(20, 10),
    //       activeShape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(14),
    //       ),
    //       color: isDark
    //           ? AppColors.dotColorDark
    //           : Theme.of(context).iconTheme.color!,
    //     ),
    //     done: Text(
    //       AppTranslationKeys.getStarted.tr,
    //       style: const TextStyle(
    //         color: Colors.white,
    //         fontSize: 20,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     doneStyle: ElevatedButton.styleFrom(
    //       padding: const EdgeInsets.symmetric(vertical: 12),
    //       primary: Theme.of(context).primaryColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(14),
    //       ),
    //     ),
    //     onDone: () {
    //       Get.offNamed(AppRouteNames.auth);
    //     },
    //     pages: [
    //       PageViewModel(
    //         title: 'Page 1',
    //         body: 'Body 1',
    //         useRowInLandscape: true,
    //       ),
    //       PageViewModel(
    //         title: 'Page 2',
    //         body: 'Body 2',
    //         useRowInLandscape: true,
    //       ),
    //       PageViewModel(
    //         title: 'Page 3',
    //         body: 'Body 3',
    //         useRowInLandscape: true,
    //       ),
    //       PageViewModel(
    //         title: 'Page 4',
    //         body: 'Body 4',
    //         useRowInLandscape: true,
    //       ),
    //     ],
    //   ),
    // );
  }
}
