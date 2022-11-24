import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/View/Models/OnBoarding/onboarding_page.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';

class OnBoardingView extends StatelessWidget {
  final OnboardingPage page;
  const OnBoardingView({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationWidget(
      portrait: _OnboardingViewPortrait(
        page: page,
      ),
      landscape: _OnboardingViewLandscape(
        page: page,
      ),
    );
  }
}

class _OnboardingViewPortrait extends StatelessWidget {
  final OnboardingPage page;
  const _OnboardingViewPortrait({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Image.asset(
            page.image!,
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                Text(
                  page.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  page.body!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _OnboardingViewLandscape extends StatelessWidget {
  final OnboardingPage page;
  const _OnboardingViewLandscape({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Image.asset(
            page.image!,
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  page.title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.07,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  page.body!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.04,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
