import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Utils/utils.dart';
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

  void setFavouriteAt(
      BuildContext context, FoodModel food, int index, bool isFavourite) {
    _mainController.foods[index] = FoodModel(
      name: food.name,
      price: food.price,
      imageUrl: food.imageUrl,
      restaurant: food.restaurant,
      restaurantImageUrl: food.restaurantImageUrl,
      rate: food.rate,
      hasOffer: food.hasOffer,
      isFavourite: isFavourite,
      oldPrice: food.oldPrice,
    );
    foods = _mainController.foods;
    update();
    Utils.showSnackBarMessage(
      isFavourite
          ? '${food.name} ${AppTranslationKeys.addedToFavourites.tr}'
          : '${food.name} ${AppTranslationKeys.removedFromFavourites.tr}',
      context,
      icon: isFavourite ? Ionicons.heart : Ionicons.heart_outline,
      iconColor: isFavourite ? AppColors.badgeColor : null,
    );
  }
}
