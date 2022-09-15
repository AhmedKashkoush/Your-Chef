import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/custom_outlined_form_field.dart';
import 'package:your_chief/View/Widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomOutlinedFormField(
              label: AppTranslationKeys.email.tr,
              prefix: Icon(Icons.email_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOutlinedFormField(
              label: AppTranslationKeys.password.tr,
              obscure: true,
              prefix: Icon(Icons.lock_outline),
              suffix: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppTranslationKeys.forgotPassword.tr,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(
              onPressed: () {
                String languageCode = 'en';
                if (Get.locale == Locale('en')) languageCode = 'ar';
                Get.updateLocale(Locale(languageCode));
              },
              text: AppTranslationKeys.login.tr,
            ),
          ],
        ),
      ),
    );
  }
}
