import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class FoodViewController extends GetxController {
  final MainScreenController _mainController = Get.find();
  late List<FoodModel> foods;
  @override
  void onInit() {
    foods = _mainController.foods;
    super.onInit();
  }

  void preview() {}
}
