import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/verification_method_controller.dart';
import 'package:your_chief/Core/Constants/app_svgs.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Utils/Options/verifications_methods.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';
import 'package:your_chief/View/Widgets/Buttons/selectable_button.dart';

class VerificationMethodScreen extends StatelessWidget {
  const VerificationMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationMethodController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppTranslationKeys.chooseVerificationMethod.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.8,
                            minHeight: MediaQuery.of(context).size.height * 0.4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SelectableButton<VerificationMethod?>(
                                title: AppTranslationKeys.viaEmail.tr,
                                currentValue: controller.selectedMethod,
                                value: VerificationMethod.mail,
                                onChanged: controller.onChanged,
                                svg: AppSVGs.sendMail,
                              ),
                              SelectableButton<VerificationMethod?>(
                                title: AppTranslationKeys.viaPhone.tr,
                                currentValue: controller.selectedMethod,
                                value: VerificationMethod.phone,
                                onChanged: controller.onChanged,
                                svg: AppSVGs.sendSms,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: PrimaryButton(
            text: AppTranslationKeys.continue_.tr,
            onPressed: controller.selectedMethod == null
                ? null
                : controller.toVerificationScreen,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              primary: Colors.green.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      );
    });
  }
}
