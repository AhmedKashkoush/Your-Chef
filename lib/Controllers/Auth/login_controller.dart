import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Validation/validation.dart';
import 'package:your_chief/Model/Repositories/Repositories/auth_repository.dart';
import 'package:your_chief/Model/Web%20Services/auth_api.dart';

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

  bool _isLoading = false;

  final AuthRepository _loginApi = AuthRepository(AuthApi());

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
    if (!EmailValidator.validate(email!.trim()))
      return _validation.notValidEmail?.tr;
    return null;
  }

  void toForgotPassword() {
    Get.toNamed(AppRouteNames.error);
  }

  void validate() async {
    if (_isLoading) return;
    if (!formKey.currentState!.validate()) return;
    if (!_isLoading)
      Get.defaultDialog(
        title: AppTranslationKeys.pleaseWait.tr,
        content: const PizzaLoading(),
        barrierDismissible: false,
        onWillPop: () async => Future.value(false),
      );
    _isLoading = true;
    dynamic _data = await _loginApi.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    Get.back();
    _isLoading = false;

    if (_data != null)
      Get.offNamed(AppRouteNames.home);
    else
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
      );
  }
}
