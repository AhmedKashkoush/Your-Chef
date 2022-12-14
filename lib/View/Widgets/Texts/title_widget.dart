import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';

class TitleWidget extends StatelessWidget {
  final double? fontSize;
  const TitleWidget({Key? key, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTranslationKeys.appTitle.tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontFamily: 'BlackLadder',
            fontSize: fontSize,
          ),
    );
  }
}
