import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:your_chief/Controllers/Auth/verify_email_controller.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerifyEmailController controller = Get.find();
    return WillPopScope(
      onWillPop: controller.backConfirm,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const OrientationWidget(
          portrait: _VerifyEmailScreenPortrait(),
          landscape: _VerifyEmailScreenLandscape(),
        ),
      ),
    );
  }
}

class _VerifyEmailScreenPortrait extends StatelessWidget {
  const _VerifyEmailScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GetBuilder<VerifyEmailController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppTranslationKeys.verifyYourEmail.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              AppTranslationKeys.verifyEmailWarning.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: OTPTextField(
                length: controller.otpLength,
                controller: controller.otpController,
                width: MediaQuery.of(context).size.width,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Theme.of(context).primaryColor,
                  enabledBorderColor: Theme.of(context).primaryColor,
                  focusBorderColor: Theme.of(context).primaryColor,
                ),
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 20,
                keyboardType: TextInputType.number,
                spaceBetween: 5,
                fieldWidth: 48,
                onChanged: controller.otpOnChanged,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: PrimaryButton(
                text: AppTranslationKeys.verify.tr,
                onPressed: !controller.canVerify
                    ? null
                    : () => controller.verify(context),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppTranslationKeys.haveNotReceiveCode.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: AppTranslationKeys.resend.tr,
                    style: !controller.canSendOtp
                        ? null
                        : Theme.of(context).textTheme.bodyText1,
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          !controller.canSendOtp ? null : controller.sendOtp,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(wordSpacing: 1.5),
            ),
          ],
        );
      }),
    );
  }
}

class _VerifyEmailScreenLandscape extends StatelessWidget {
  const _VerifyEmailScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
      child: GetBuilder<VerifyEmailController>(builder: (controller) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppTranslationKeys.verifyYourEmail.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppTranslationKeys.verifyEmailWarning.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                    ),
                    child: OTPTextField(
                      length: controller.otpLength,
                      controller: controller.otpController,
                      width: MediaQuery.of(context).size.width,
                      otpFieldStyle: OtpFieldStyle(
                        borderColor: Theme.of(context).primaryColor,
                        enabledBorderColor: Theme.of(context).primaryColor,
                        focusBorderColor: Theme.of(context).primaryColor,
                      ),
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 20,
                      keyboardType: TextInputType.number,
                      spaceBetween: 5,
                      fieldWidth: 48,
                      onChanged: controller.otpOnChanged,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: PrimaryButton(
                      text: AppTranslationKeys.verify.tr,
                      onPressed: !controller.canVerify
                          ? null
                          : () => controller.verify(context),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppTranslationKeys.haveNotReceiveCode.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: AppTranslationKeys.resend.tr,
                          style: !controller.canSendOtp
                              ? null
                              : Theme.of(context).textTheme.bodyText1,
                          recognizer: TapGestureRecognizer()
                            ..onTap = !controller.canSendOtp
                                ? null
                                : controller.sendOtp,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(wordSpacing: 1.5),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
