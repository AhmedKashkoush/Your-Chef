import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_animations.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/Animations/sized_asset_animation.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: OrientationWidget(
        portrait: _PageNotFoundPortrait(),
        landscape: _PageNotFoundLandScape(),
      ),
    );
  }
}

class _PageNotFoundPortrait extends StatelessWidget {
  const _PageNotFoundPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedAssetAnimation(url: AppAnimations.orderNotFound),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppTranslationKeys.pageNotFound.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}

class _PageNotFoundLandScape extends StatelessWidget {
  const _PageNotFoundLandScape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedAssetAnimation(url: AppAnimations.orderNotFound),
        const SizedBox(
          width: 80,
        ),
        Text(
          AppTranslationKeys.pageNotFound.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
