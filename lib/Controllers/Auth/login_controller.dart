import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Validation/validation.dart';

import '../../Core/Constants/app_translation_keys.dart';
import '../../View/Widgets/pizza_loading.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validation _validation = Validation();
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  bool _canLogin = false;
  bool get canLogin => _canLogin;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisiblity() {
    _isPasswordHidden = !_isPasswordHidden;
    update();
  }

  void onFieldChanged(String s) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      if (_canLogin) {
        _canLogin = false;
        update();
      }
      return;
    }
    if (!_canLogin) {
      _canLogin = true;
      update();
    }
  }

  String? emailValidator(String? email) {
    if (!EmailValidator.validate(email!)) return _validation.notValidEmail?.tr;
    return null;
  }

  void toForgotPassword() {
    Get.toNamed(AppRouteNames.error);
  }

  void validate() async {
    Get.defaultDialog(
      title: AppTranslationKeys.pleaseWait.tr,
      content: const PizzaLoading(),
      barrierDismissible: false,
      onWillPop: () async => Future.value(false),
    );
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
    if (!formKey.currentState!.validate()) return;
    Get.offNamed(AppRouteNames.home);
  }
}
