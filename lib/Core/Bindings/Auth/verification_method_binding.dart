import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/verification_method_controller.dart';

class VerificationMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VerificationMethodController());
  }
}
