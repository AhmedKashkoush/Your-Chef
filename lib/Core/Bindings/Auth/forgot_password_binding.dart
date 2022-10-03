import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordController());
  }
}
