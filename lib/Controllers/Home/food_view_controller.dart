import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Model/Models/category_model.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class FoodViewController extends GetxController {
  final MainScreenController _mainController = Get.find();
  final ScrollController mainScrollController = ScrollController();
  final ScrollController filteredScrollController = ScrollController();
  bool _isGrid = false;
  int _selectedCategory = 0;
  List<FoodModel> _foods = [];
  List<FoodModel> _foodsFiltered = [];
  List<CategoryModel> _categories = [];
  // final List<String> _testCategories = [
  //   'All',
  //   'Hamburger',
  //   'Pizza',
  //   'Pasta',
  //   'Drinks',
  //   'Snacks',
  // ];
  bool get isGrid => _isGrid;
  int get selectedCategory => _selectedCategory;
  List<FoodModel> get foods => _foods;
  List<FoodModel> get foodsFiltered => _foodsFiltered;
  List<CategoryModel> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingCategories = false;
  bool get isLoadingCategories => _isLoadingCategories;

  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;
  bool _loadingMoreFiltered = false;
  bool get loadingMoreFiltered => _loadingMoreFiltered;
  @override
  void onInit() {
    _isGrid = _mainController.isGrid;
    _selectedCategory = _mainController.selectedCategory;
    mainScrollController.addListener(mainScrollListener);
    _loadData();
    super.onInit();
  }

  void mainScrollListener() {
    if (_loadingMore || !_mainController.hasMore) return;
    double pixels = mainScrollController.position.pixels;
    // double minExtent = mainScrollController.position.minScrollExtent;
    double maxExtent = mainScrollController.position.maxScrollExtent;
    if (pixels > maxExtent - 200) {
      _paginateData();
    }
  }

  void toggleGrid() {
    _isGrid = !_isGrid;
    _mainController.toggleGrid();
    update();
  }

  void selectCategory(int index) async {
    _selectedCategory = index;
    _mainController.selectCategory(index);
    update();
    await _mainController.loadFoodsWithCategory(index);
    _foodsFiltered = _mainController.filteredFoods;
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
      id: food.id,
      name: food.name,
      description: food.description,
      price: food.price,
      imageUrl: food.imageUrl,
      restaurant: food.restaurant,
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
    if (!_mainController.categoriesLoaded) {
      _isLoadingCategories = true;
    }
    if (!_mainController.foodLoaded) {
      _isLoading = true;
      update();
      await _mainController.loadCategories();
      await _mainController.loadFoods();
      _isLoading = false;
      _isLoadingCategories = false;
    }
    _categories = _mainController.categories;
    _foods = _mainController.foods;
    _foodsFiltered = _mainController.filteredFoods;
    update();
  }

  Future<void> _paginateData() async {
    if (!_mainController.hasMore) return;
    _loadingMore = true;
    update();
    await _mainController.paginateFoods();
    _foods = _mainController.foods;
    _loadingMore = false;
    update();
  }

  Future<void> _reloadData() async {
    _isLoading = true;
    update();
    await _mainController.reloadFoods();
    _categories = _mainController.categories;
    _foods = _mainController.foods;
    _isLoading = false;
    update();
  }

  Future<void> refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    _foods.clear();
    await _reloadData();
  }
}
