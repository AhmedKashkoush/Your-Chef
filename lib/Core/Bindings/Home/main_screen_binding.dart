import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController());
    //Get.lazyPut(HomeViewController());
    //Get.lazyPut(MenuViewController());
    //Get.lazyPut(RestaurantsViewController());
    //Get.lazyPut(FavouritesViewController());
  }
}
