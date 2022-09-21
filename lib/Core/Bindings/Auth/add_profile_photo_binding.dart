import 'package:get/get.dart';
import 'package:your_chief/Controllers/Auth/add_profile_photo_controller.dart';

class AddProfilePhotoBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddProfilePhotoController());
  }
}
