import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';

import '../../Core/Constants/app_translation_keys.dart';
import '../../Core/Utils/utils.dart';

class VerifyEmailController extends GetxController {
  dynamic args = Get.arguments;
  final int otpLength = 5;
  bool canVerify = false;
  bool canSendOtp = true;
  late Timer _timer;
  int _seconds = 2;

  bool _isLoading = false;

  String _otp = '';

  //final AuthRepository _otpApi = AuthRepository(AuthApi());

  @override
  void onInit() {
    sendOtp();
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setTimer(int seconds) async {
    canSendOtp = false;
    update();
    _seconds = seconds;
    _timer = await Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0)
        _seconds--;
      else {
        canSendOtp = true;
        _timer.cancel();
        update();
      }
    });
  }

  void otpOnChanged(String otp) {
    _otp = otp;
    if (otp.length == otpLength) {
      if (!canVerify) {
        canVerify = true;
        update();
      }
    } else if (canVerify) {
      canVerify = false;
      update();
    }
  }

  void verify(BuildContext context) async {
    if (_isLoading) return;
    if (!_isLoading) Utils.showLoadingDialog(AppTranslationKeys.pleaseWait.tr);
    _isLoading = true;
    // dynamic _data = await _otpApi.verifyOtp(
    //   args['email'],
    //   _otp,
    // );
    Get.back();
    _isLoading = false;
    Get.offNamed(AppRouteNames.resetPassword);
    // if (_data != null) {
    //   if (_data is ApiMessages) {
    //     Utils.showSnackBarMessage(
    //       _data.message,
    //       context,
    //       messageType: MessageType.error,
    //       borderRadius: 15,
    //     );
    //   } else {
    //     Get.offNamed(AppRouteNames.resetPassword);
    //   }
    // } else {
    //   Utils.showSnackBarMessage(
    //     AppTranslationKeys.somethingWentWrong.tr,
    //     context,
    //     messageType: MessageType.error,
    //     borderRadius: 15,
    //   );
    // }
  }

  void sendOtp() async {
    _setTimer(2);
    // dynamic _data = await _otpApi.sendOtp(args['email']);
    // if (_data != null) {
    //   if (_data is ApiMessages) {
    //     Get.snackbar('error', _data.message);
    //   }
    // }
  }

  Future<bool> backConfirm() async {
    //Confirmation code
    return Future.value(true);
  }
}