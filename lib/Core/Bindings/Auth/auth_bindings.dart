import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/login_controller.dart';
import 'package:your_chief/Controllers/Auth/register_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegisterController());
  }
}
