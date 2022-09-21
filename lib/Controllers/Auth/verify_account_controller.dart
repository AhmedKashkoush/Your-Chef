import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';

class VerifyAccountController extends GetxController {
  dynamic args = Get.arguments;
  final int otpLength = 5;
  bool canVerify = false;

  @override
  void onInit() {
    super.onInit();
  }

  void otpOnChanged(String otp) {
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

  void verify() async {
    Get.offNamed(AppRouteNames.verificationComplete);
  }

  void sendOtp() async {}
}
