import 'package:get/get.dart';

import '../../../Controllers/Auth/verify_email_controller.dart';

class VerifyEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerifyEmailController());
  }
}
