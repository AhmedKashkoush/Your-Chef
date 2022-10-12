import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/search_screen_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchScreenController());
  }
}
