import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  bool isReadyToConfirm = false;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  void toggleConfirmVisibility() {
    isConfirmHidden = !isConfirmHidden;
    update();
  }

  void onTextChange(String? text) {
    if (newPasswordController.text.length > 8 &&
        confirmPasswordController.text.length > 8 &&
        confirmPasswordController.text == newPasswordController.text) {
      if (!isReadyToConfirm) {
        isReadyToConfirm = true;
        update();
      }
    } else {
      if (isReadyToConfirm) {
        isReadyToConfirm = false;
        update();
      }
    }
  }

  void validate(BuildContext context) {}
}
