import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/Cart/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
