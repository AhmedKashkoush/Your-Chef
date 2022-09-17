import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/register_controller.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/custom_outlined_form_field.dart';
import 'package:your_chief/View/Widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 28),
        child: GetBuilder<RegisterController>(
          builder: (controller) => Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedFormField(
                        label: AppTranslationKeys.fname.tr,
                        controller: controller.fnameController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomOutlinedFormField(
                        label: AppTranslationKeys.lname.tr,
                        controller: controller.lnameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlinedFormField(
                  label: AppTranslationKeys.phone.tr,
                  prefix: Icon(Icons.call_outlined),
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlinedFormField(
                  label: AppTranslationKeys.email.tr,
                  prefix: Icon(Icons.email_outlined),
                  controller: controller.emailController,
                  validator: controller.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlinedFormField(
                  label: AppTranslationKeys.password.tr,
                  obscure: controller.isPasswordHidden,
                  prefix: Icon(Icons.lock_outline),
                  suffix: IconButton(
                    icon: controller.isPasswordHidden
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      controller.togglePasswordVisiblity();
                    },
                  ),
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlinedFormField(
                  label: AppTranslationKeys.confirmPass.tr,
                  obscure: controller.isConfirmHidden,
                  prefix: Icon(Icons.confirmation_number_outlined),
                  suffix: IconButton(
                    icon: controller.isConfirmHidden
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      controller.toggleConfirmVisiblity();
                    },
                  ),
                  controller: controller.confirmController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  onPressed: () async {
                    controller.validate();
                  },
                  text: AppTranslationKeys.register.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
