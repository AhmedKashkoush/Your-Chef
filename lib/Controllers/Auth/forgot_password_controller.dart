import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/Routing/route_names.dart';
import '../../Core/Validation/validation.dart';

class ForgotPasswordController extends GetxController {
  late dynamic args;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final Validation _validation = Validation();

  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) return _validation.required?.tr;
    if (!EmailValidator.validate(email.trim()))
      return _validation.notValidEmail?.tr;
    return null;
  }

  void validate(BuildContext context) async {
    if (_isLoading) return;
    if (!formKey.currentState!.validate()) return;
    args = {
      'email': emailController.text.trim(),
    };
    Get.offAndToNamed(AppRouteNames.verifyEmail, arguments: args);
  }
}
