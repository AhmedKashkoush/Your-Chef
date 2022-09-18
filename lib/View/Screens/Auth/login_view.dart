import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/login_controller.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Widgets/custom_outlined_form_field.dart';
import 'package:your_chief/View/Widgets/pizza_loading.dart';
import 'package:your_chief/View/Widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 28),
        child: GetBuilder<LoginController>(
          builder: (controller) => Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomOutlinedFormField(
                  label: AppTranslationKeys.email.tr,
                  prefix: Icon(Icons.email_outlined),
                  controller: controller.emailController,
                  validator: controller.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: controller.onFieldChanged,
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
                  onChanged: controller.onFieldChanged,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    //navigate to forget password page
                    Get.toNamed(AppRouteNames.error);
                  },
                  child: Text(
                    AppTranslationKeys.forgotPassword.tr,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  onPressed: !controller.canLogin
                      ? null
                      : () async {
                          Get.defaultDialog(
                            title: AppTranslationKeys.pleaseWait.tr,
                            content: const PizzaLoading(),
                            barrierDismissible: false,
                            onWillPop: () async => Future.value(false),
                          );
                          await Future.delayed(const Duration(seconds: 3));
                          Get.back();
                          controller.validate();
                        },
                  text: AppTranslationKeys.login.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
