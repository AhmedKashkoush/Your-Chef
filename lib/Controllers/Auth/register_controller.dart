import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Utils/Options/message_types.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Core/Validation/validation.dart';
import 'package:your_chief/Model/Repository/Repositories/auth_repository.dart';
import 'package:your_chief/Model/Web%20Services/auth_api.dart';

import '../../Core/Routing/route_names.dart';

class RegisterController extends GetxController {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> genders = [
    AppTranslationKeys.male,
    AppTranslationKeys.female,
  ];
  final List<IconData> genderIcons = [
    Ionicons.male_outline,
    Ionicons.female_outline,
  ];
  final Validation _validation = Validation();
  bool _isPasswordHidden = true;
  bool _isConfirmHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmHidden => _isConfirmHidden;

  String? _gender;
  String? get gender => _gender;

  IconData _genderIcon = Ionicons.male_female_outline;
  IconData get genderIcon => _genderIcon;

  Map<String, dynamic> _args = {};
  Map<String, dynamic> get args => _args;

  final AuthRepository _registerApi = AuthRepository(AuthApi());

  bool _isLoading = false;

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

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    update();
  }

  void toggleConfirmVisibility() {
    _isConfirmHidden = !_isConfirmHidden;
    update();
  }

  void onGenderChanged(String? value) {
    _gender = value;
    int index = genders.indexOf(_gender!);
    _genderIcon = genderIcons[index];
    update();
  }

  String? nameValidator(String? name) {
    if (name!.trim().isEmpty) return _validation.required?.tr;
    if (name.trim().length < 3) return _validation.name?.tr;
    return null;
  }

  String? genderValidator(String? gender) {
    if (gender == null) return _validation.required?.tr;
    if (gender.isEmpty) return _validation.required?.tr;
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone!.isEmpty) return _validation.required?.tr;
    return null;
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) return _validation.required?.tr;
    if (!EmailValidator.validate(email.trim()))
      return _validation.notValidEmail?.tr;
    return null;
  }

  String? paswordValidator(String? password) {
    if (password!.isEmpty) return _validation.required?.tr;
    if (password.length < 8) return _validation.passwordLength?.tr;
    return null;
  }

  String? confirmValidator(String? confirm) {
    if (confirm!.isEmpty) return _validation.required?.tr;
    if (confirm != passwordController.text) return _validation.confirm?.tr;
    return null;
  }

  void validate(BuildContext context) async {
    if (_isLoading) return;
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      args['name'] =
          '${fnameController.text.trim()} ${lnameController.text.trim()}';
      args['gender'] = gender == AppTranslationKeys.male ? 1 : 2;
      args['phone'] = '${phoneController.text}';
      args['email'] = '${emailController.text}';
      args['password'] = '${passwordController.text}';
      if (!_isLoading)
        Utils.showLoadingDialog(AppTranslationKeys.pleaseWait.tr);

      _isLoading = true;
      dynamic _data = await _registerApi.register(
        args['name'].trim(),
        args['gender'],
        args['phone'].trim(),
        args['email'].trim(),
        args['password'].trim(),
      );
      Get.back();
      _isLoading = false;

      if (_data != null) {
        if (_data is ApiMessages) {
          Utils.showSnackBarMessage(
            _data.message,
            context,
            messageType: MessageType.error,
          );
        } else
          Get.offNamed(
            AppRouteNames.addProfilePhoto,
            arguments: args,
          );
      } else {
        Utils.showSnackBarMessage(
          AppTranslationKeys.somethingWentWrong.tr,
          context,
          messageType: MessageType.error,
        );
      }
    }
  }

  void registerWithGoogle() {}

  void registerWithFacebook() {}
}
