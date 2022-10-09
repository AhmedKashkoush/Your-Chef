import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController());
  }
}
