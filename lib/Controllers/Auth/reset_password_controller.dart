import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Core/Validation/validation.dart';
import 'package:your_chief/Model/Repository/Repositories/auth_repository.dart';
import 'package:your_chief/Model/Web%20Services/auth_api.dart';

class ResetPasswordController extends GetxController {
  final dynamic _args = Get.arguments;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isPasswordHidden = true;
  bool _isConfirmHidden = true;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmHidden => _isConfirmHidden;

  bool _isReadyToConfirm = false;
  bool get isReadyToConfirm => _isReadyToConfirm;

  final Validation _validation = Validation();

  Map<String, dynamic> get args => _args;

  final AuthRepository _resetApi = AuthRepository(AuthApi());

  bool _isLoading = false;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    _isPasswordHidden = !isPasswordHidden;
    update();
  }

  void toggleConfirmVisibility() {
    _isConfirmHidden = !isConfirmHidden;
    update();
  }

  void onTextChange(String? text) {
    if (newPasswordController.text.length > 8 &&
        confirmPasswordController.text.length > 8 &&
        confirmPasswordController.text == newPasswordController.text) {
      if (!isReadyToConfirm) {
        _isReadyToConfirm = true;
        update();
      }
    } else {
      if (isReadyToConfirm) {
        _isReadyToConfirm = false;
        update();
      }
    }
  }

  String? paswordValidator(String? password) {
    if (password!.isEmpty) return _validation.required?.tr;
    if (password.length < 8) return _validation.passwordLength?.tr;
    return null;
  }

  String? confirmValidator(String? confirm) {
    if (confirm!.isEmpty) return _validation.required?.tr;
    if (confirm != newPasswordController.text) return _validation.confirm?.tr;
    return null;
  }

  void validate(BuildContext context) async {
    if (_isLoading) return;
    if (!formKey.currentState!.validate()) return;
    Utils.showLoadingDialog(AppTranslationKeys.pleaseWait.tr);

    _isLoading = true;
    dynamic _data = await _resetApi.resetPassword(
      args['email'],
      newPasswordController.text.trim(),
    );
    Get.back();
    _isLoading = false;

    if (_data != null) {
      if (_data is ApiMessages) {
        Utils.showSnackBarMessage(
          _data.message,
          context,
          messageType: MessageType.error,
          borderRadius: 15,
        );
      } else {
        Utils.showSnackBarMessage(
          AppTranslationKeys.passwordSet.tr,
          context,
          messageType: MessageType.success,
          borderRadius: 15,
        );
        Get.back();
      }
    } else {
      Utils.showSnackBarMessage(
        AppTranslationKeys.somethingWentWrong.tr,
        context,
        messageType: MessageType.error,
        borderRadius: 15,
      );
    }
  }
}
