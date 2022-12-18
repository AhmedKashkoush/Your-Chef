import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class FoodViewController extends GetxController {
  final MainScreenController _mainController = Get.find();
  bool _isGrid = false;
  int _selectedCategory = 0;
  late List<FoodModel> _foods;
  List<FoodModel> _foodsFiltered = [];
  late List<String> _categories;
  final List<String> _testCategories = [
    'All',
    'Hamburger',
    'Pizza',
    'Pasta',
    'Drinks',
    'Snacks',
  ];
  bool get isGrid => _isGrid;
  int get selectedCategory => _selectedCategory;
  List<FoodModel> get foods => _foods;
  List<FoodModel> get foodsFiltered => _foodsFiltered;
  List<String> get categories => _categories;
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void toggleGrid() {
    _isGrid = !_isGrid;
    update();
  }

  void selectCategory(int index) {
    _selectedCategory = index;
    update();
  }

  void preview(FoodModel food, int index) {
    Get.toNamed(
      AppRouteNames.foodDetails,
      arguments: {
        'food': food,
        'index': index,
      },
    );
  }

  void setFavouriteAt(
      BuildContext context, FoodModel food, int index, bool isFavourite) {
    _mainController.foods[index] = FoodModel(
      name: food.name,
      description: food.description,
      price: food.price,
      imageUrl: food.imageUrl,
      restaurant: food.restaurant,
      restaurantImageUrl: food.restaurantImageUrl,
      rate: food.rate,
      stock: food.stock,
      hasOffer: food.hasOffer,
      isFavourite: isFavourite,
      oldPrice: food.oldPrice,
    );
    _foods = _mainController.foods;
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

  Future<void> _loadData() async {
    _categories = _testCategories;
    _foods = _mainController.foods;
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
