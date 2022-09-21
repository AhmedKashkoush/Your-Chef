import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Validation/validation.dart';

import '../../Core/Routing/route_names.dart';

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

  Map<String, dynamic> _args = {};
  Map<String, dynamic> get args => _args;

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void togglePasswordVisiblity() {
    _isPasswordHidden = !_isPasswordHidden;
    update();
  }

  void toggleConfirmVisiblity() {
    _isConfirmHidden = !_isConfirmHidden;
    update();
  }

  String? nameValidator(String? name) {
    if (name!.isEmpty) return _validation.required?.tr;
    if (name.length < 3) return _validation.name?.tr;
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone!.isEmpty) return _validation.required?.tr;
    return null;
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) return _validation.required?.tr;
    if (!EmailValidator.validate(email)) return _validation.notValidEmail?.tr;
    return null;
  }

  String? paswordValidator(String? password) {
    if (password!.isEmpty) return _validation.required?.tr;
    if (password.length < 8) return _validation.passwordLength?.tr;
    //if (!_passValidator.validate(password)) return _validation.notValidPassword;
    return null;
  }

  String? confirmValidator(String? confirm) {
    if (confirm!.isEmpty) return _validation.required?.tr;
    if (confirm != passwordController.text) return _validation.confirm?.tr;
    return null;
  }

  void validate() {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      args['name'] = '${fnameController.text} ${lnameController.text}';
      args['phone'] = '${phoneController.text}';
      args['email'] = '${emailController.text}';
      args['password'] = '${passwordController.text}';
      Get.offNamed(
        AppRouteNames.addProfilePhoto,
        arguments: args,
      );
    }
  }
}
