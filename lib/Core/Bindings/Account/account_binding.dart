import 'package:get/get.dart';
import 'package:your_chief/Controllers/Account/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}
