import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/View/Screens/Home/food_view.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  int get currentPage => _currentPage;
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  List<FoodModel> foods = [
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      hasOffer: true,
      oldPrice: 50,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      hasOffer: true,
      oldPrice: 50,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      hasOffer: true,
      oldPrice: 50,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      hasOffer: true,
      oldPrice: 50,
      stock: 14,
    ),
    FoodModel(
      name: 'Big mac combo',
      description: 'Very Delicious',
      price: 29.99,
      imageUrl: AppImages.hamburger,
      restaurant: "McDonald's",
      restaurantImageUrl: AppImages.mcdonalds,
      rate: 3.5,
      stock: 14,
    ),
  ];

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

  void goToCart() {}

  Future<bool> onAppClose() async {
    if (_currentPage != 0) {
      _currentPage = 0;
      update();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
