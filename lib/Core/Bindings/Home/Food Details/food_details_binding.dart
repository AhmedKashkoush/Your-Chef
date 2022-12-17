import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/Food%20Details/food_details_controller.dart';

class FoodDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FoodDetailsController());
  }
}
