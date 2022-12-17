import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class FoodDetailsController extends GetxController {
  final ScrollController listController = ScrollController();
  late final FoodModel food;
  late final int index;
  int _amount = 0;
  int get amount => _amount;
  final args = Get.arguments;
  bool _showTitle = false;
  bool get showTitle => _showTitle;
  @override
  void onInit() {
    food = args['food'] as FoodModel;
    index = args['index'] as int;
    listController.addListener(() {
      if (listController.position.pixels > kToolbarHeight * 4) {
        if (!_showTitle) {
          _showTitle = true;
          update();
        }
      } else {
        if (_showTitle) {
          _showTitle = false;
          update();
        }
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    listController.dispose();
    super.dispose();
  }

  void incrementAmount() {
    if (amount < 100) _amount++;
    update();
  }

  void decrementAmount() {
    if (_amount > 0) _amount--;
    update();
  }

  void addToCart(BuildContext context) {}
}
