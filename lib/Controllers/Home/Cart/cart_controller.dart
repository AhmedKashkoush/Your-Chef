import 'package:get/get.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class CartController extends GetxController {
  List<FoodModel> _cart = [];
  List<FoodModel> get cart => _cart;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    loadCart();
    super.onInit();
  }

  void loadCart() {
    _isLoading = true;
    Future.delayed(
      const Duration(seconds: 6),
      () {
        _isLoading = false;
        update();
      },
    );
  }

  void buy(FoodModel food) {}
  void remove(int index) {}
}
