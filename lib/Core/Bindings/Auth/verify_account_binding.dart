import 'package:get/get.dart';

import '../../../Controllers/Auth/verify_account_controller.dart';

class VerifyAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerifyAccountController());
  }
}
