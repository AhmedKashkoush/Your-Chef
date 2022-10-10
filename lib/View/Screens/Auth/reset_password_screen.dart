import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/reset_password_controller.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';
import 'package:your_chief/View/Widgets/TextFields/custom_outlined_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const OrientationWidget(
        portrait: _ResetPasswordScreenPortrait(),
        landscape: _ResetPasswordScreenLandscape(),
      ),
    );
  }
}

class _ResetPasswordScreenPortrait extends StatelessWidget {
  const _ResetPasswordScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Text(
              AppTranslationKeys.typeYourNewPassword.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            const SizedBox(
              height: 100,
            ),
            CustomOutlinedFormField(
              label: AppTranslationKeys.newPassword.tr,
              prefix: Icon(Icons.lock_outlined),
              controller: controller.newPasswordController,
              //validator: controller.emailValidator,
              onChanged: controller.onTextChange,
              obscure: controller.isPasswordHidden,
              suffix: IconButton(
                icon: controller.isPasswordHidden
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomOutlinedFormField(
              label: AppTranslationKeys.confirmPass.tr,
              prefix: Icon(Icons.confirmation_num_outlined),
              controller: controller.confirmPasswordController,
              //validator: controller.emailValidator,
              onChanged: controller.onTextChange,
              obscure: controller.isConfirmHidden,
              suffix: IconButton(
                icon: controller.isConfirmHidden
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: controller.toggleConfirmVisibility,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(
              text: AppTranslationKeys.confirm.tr,
              onPressed: !controller.isReadyToConfirm
                  ? null
                  : () {
                      controller.validate(context);
                    },
            ),
          ],
        ),
      );
    });
  }
}

class _ResetPasswordScreenLandscape extends StatelessWidget {
  const _ResetPasswordScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
