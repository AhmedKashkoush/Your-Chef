import 'package:get/get.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/View/Screens/Auth/verification_method_screen.dart';

class VerificationMethodController extends GetxController {
  dynamic args = Get.arguments;
  VerificationMethod? selectedMethod;
  void toVerificationScreen() {
    args['via'] = selectedMethod?.name.toUpperCase();
    Get.offNamed(
      AppRouteNames.registerVerify,
      arguments: args,
    );
  }

  void onChanged(VerificationMethod? method) {
    selectedMethod = method;
    update();
  }
}
