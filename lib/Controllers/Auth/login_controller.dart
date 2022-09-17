import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Validation/validation.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validation _validation = Validation();
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  void togglePasswordVisiblity() {
    _isPasswordHidden = !_isPasswordHidden;
    update();
  }

  String? emailValidator(String? email) {
    if (!EmailValidator.validate(email!)) return _validation.notValidEmail;
    return null;
  }

  void validate() {
    if (!formKey.currentState!.validate()) return;
  }
}
