import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Model/Models/category_model.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/Model/Repository/Repositories/category_repository.dart';
import 'package:your_chief/Model/Repository/Repositories/food_repository.dart';
import 'package:your_chief/Model/Web%20Services/category_api.dart';
import 'package:your_chief/Model/Web%20Services/food_api.dart';
import 'package:your_chief/View/Screens/Home/food_view.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  int get currentPage => _currentPage;
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  final CategoryRepository _categoryApi = CategoryRepository(CategoryApi());
  final FoodRepository _foodsApi = FoodRepository(FoodApi());

  List<CategoryModel> _categories = [];
  List<FoodModel> _foods = [];
  // List<FoodModel> _foods
  // [
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     hasOffer: true,
  //     oldPrice: 50,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     hasOffer: true,
  //     oldPrice: 50,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     hasOffer: true,
  //     oldPrice: 50,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     hasOffer: true,
  //     oldPrice: 50,
  //     stock: 14,
  //   ),
  //   FoodModel(
  //     name: 'Big mac combo',
  //     description: 'Very Delicious',
  //     price: 29.99,
  //     imageUrl: AppImages.hamburger,
  //     restaurant: "McDonald's",
  //     restaurantImageUrl: AppImages.mcdonalds,
  //     rate: 3.5,
  //     stock: 14,
  //   ),
  // ];

  List<FoodModel> _filteredFoods = [];

  List<CategoryModel> get categories => _categories;
  List<FoodModel> get foods => _foods;
  List<FoodModel> get filteredFoods => _filteredFoods;

  @override
  void onInit() {
    _currentUser = CurrentUser.user;
    super.onInit();
  }

  final List<Widget> pages = const [
    SizedBox(),
    FoodView(),
    SizedBox(),
    SizedBox(),
  ];

  void openDrawer() {
    homeKey.currentState?.openDrawer();
  }

  void changePage(int index) {
    _currentPage = index;
    update();
  }

  void onSearchTap() {
    Get.toNamed(AppRouteNames.homeSearch);
  }

  void goToCart(BuildContext context) {
    Utils.removeCurrentMessage(context);
    Get.toNamed(AppRouteNames.cart);
  }

  Future<bool> onAppClose() async {
    if (_currentPage != 0) {
      _currentPage = 0;
      update();
      return Future.value(false);
    }
    return Future.value(true);
  }

  //food view
  int _foodPage = 1;
  int get foodPage => _foodPage;
  int _filteredFoodPage = 1;
  int get filteredFoodPage => _filteredFoodPage;
  bool _foodLoaded = false;
  bool _categoriesLoaded = false;
  bool _isGrid = false;
  bool get foodLoaded => _foodLoaded;
  bool get categoriesLoaded => _categoriesLoaded;
  bool get isGrid => _isGrid;
  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;

  void toggleGrid() {
    _isGrid = !_isGrid;
  }

  void selectCategory(int index) {
    _selectedCategory = index;
  }

  Future<void> loadFoodsWithCategory(int index) async {
    if (index == 0) return;
    _filteredFoodPage = 1;
    _filteredFoods = await _foodsApi.getFoodsWithCategory(
      CurrentUser.token!,
      _categories[index].id,
      _filteredFoodPage,
    );
  }

  void setPage(int page) {
    _foodPage = page;
  }

  Future<void> loadFoods() async {
    if (_selectedCategory != 0) {
      await loadFoodsWithCategory(_selectedCategory);
      return;
    }
    if (_foodLoaded) return;
    _foods = await _foodsApi.getAllFoods(CurrentUser.token!, _foodPage, 10);
    _foodLoaded = true;
  }

  Future<void> loadCategories() async {
    if (!_categoriesLoaded) {
      final List<CategoryModel> loadedCategories =
          await _categoryApi.getCategories(CurrentUser.token!);
      if (loadedCategories is ApiMessages) return;
      _categories = [CategoryModel(id: 0, name: 'All'), ...loadedCategories];
      if (!_foodLoaded) return;
      _categoriesLoaded = true;
    }
  }

  Future<void> reloadFoods() async {
    _foodLoaded = false;
    loadFoods();
  }
}
