import 'package:get/get.dart';
import 'package:your_chief/Controllers/Onboarding/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
