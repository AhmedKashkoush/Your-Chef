import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Validation/validation.dart';

class RegisterController extends GetxController {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Validation _validation = Validation();
  bool _isPasswordHidden = true;
  bool _isConfirmHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmHidden => _isConfirmHidden;
  void togglePasswordVisiblity() {
    _isPasswordHidden = !_isPasswordHidden;
    update();
  }

  void toggleConfirmVisiblity() {
    _isConfirmHidden = !_isConfirmHidden;
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
