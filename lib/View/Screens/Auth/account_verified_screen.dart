import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';

import '../../../Core/Routing/route_names.dart';

class AccountVerifiedScreen extends StatelessWidget {
  const AccountVerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const OrientationWidget(
        portrait: _AccountVerifiedScreenPortrait(),
        landscape: _AccountVerifiedScreenLandscape(),
      ),
    );
  }
}

class _AccountVerifiedScreenPortrait extends StatelessWidget {
  const _AccountVerifiedScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24.0,
        left: 24.0,
        top: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppTranslationKeys.congratulations.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          Icon(
            Icons.verified_user_outlined,
            size: 300,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            AppTranslationKeys.congratulatingMessage.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                ),
          ),
          const SizedBox(
            height: 70,
          ),
          PrimaryButton(
            text: AppTranslationKeys.goToLoginPage.tr,
            onPressed: () {
              Get.offNamed(AppRouteNames.auth);
            },
          ),
        ],
      ),
    );
  }
}

class _AccountVerifiedScreenLandscape extends StatelessWidget {
  const _AccountVerifiedScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Row(
        children: [
          Icon(
            Icons.verified_user_outlined,
            size: 300,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppTranslationKeys.congratulations.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    AppTranslationKeys.congratulatingMessage.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 17,
                        ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  PrimaryButton(
                    text: AppTranslationKeys.goToLoginPage.tr,
                    onPressed: () {
                      Get.offNamed(AppRouteNames.auth);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
