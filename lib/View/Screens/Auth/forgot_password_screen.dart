import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/forgot_password_controller.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';
import 'package:your_chief/View/Widgets/TextFields/custom_outlined_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const OrientationWidget(
        portrait: _ForgotPasswordScreenPortrait(),
        landscape: _ForgotPasswordScreenLandscape(),
      ),
    );
  }
}

class _ForgotPasswordScreenPortrait extends StatelessWidget {
  const _ForgotPasswordScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Text(
              AppTranslationKeys.forgotPassword.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              AppImages.yourChefForgot,
              width: 280,
              height: 280,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomOutlinedFormField(
              label: AppTranslationKeys.email.tr,
              prefix: Icon(Icons.email_outlined),
              controller: controller.emailController,
              validator: controller.emailValidator,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              AppTranslationKeys.forgotPasswordMessage.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                  ),
            ),
            const SizedBox(
              height: 60,
            ),
            PrimaryButton(
              text: AppTranslationKeys.resetYourPassword.tr,
              onPressed: () {
                controller.validate(context);
              },
            ),
          ],
        ),
      );
    });
  }
}

class _ForgotPasswordScreenLandscape extends StatelessWidget {
  const _ForgotPasswordScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 0),
        child: Row(
          children: [
            Image.asset(
              AppImages.yourChefForgot,
              width: 280,
              height: 280,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.only(top: 2),
                  children: [
                    Text(
                      AppTranslationKeys.forgotPassword.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomOutlinedFormField(
                      label: AppTranslationKeys.email.tr,
                      prefix: Icon(Icons.email_outlined),
                      controller: controller.emailController,
                      validator: controller.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppTranslationKeys.forgotPasswordMessage.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                      text: AppTranslationKeys.resetYourPassword.tr,
                      onPressed: () {
                        controller.validate(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
