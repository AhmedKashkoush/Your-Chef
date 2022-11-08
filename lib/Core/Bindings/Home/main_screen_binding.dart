import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/food_view_controller.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    //Get.lazyPut(HomeViewController());
    Get.lazyPut(() => FoodViewController(), fenix: true);
    //Get.lazyPut(RestaurantsViewController());
    //Get.lazyPut(FavouritesViewController());
  }
}
