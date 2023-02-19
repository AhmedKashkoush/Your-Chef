import 'package:get/get.dart';

import '../../../Controllers/Restaurant/restaurant_screen_controller.dart';

class RestaurantScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantScreenController());
  }
}
