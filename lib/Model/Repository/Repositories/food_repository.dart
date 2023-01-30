import 'package:your_chief/Model/Repository/Structure/food_structure.dart';

class FoodRepository implements IFoodRepository {
  final IFoodRepository repository;

  const FoodRepository(this.repository);
  @override
  Future? getAllFoods(String token, int page, [int? limit]) async {
    return await repository.getAllFoods(token, page, limit!);
  }

  @override
  Future? getFoodsFromRestaurant(String token, int page, int restaurantId,
      [int? limit]) async {
    return await repository.getFoodsFromRestaurant(
        token, page, restaurantId, limit!);
  }

  @override
  Future? getFoodsWithCategory(String token, int page, int categoryId,
      [int? limit]) async {
    return await repository.getFoodsWithCategory(
        token, page, categoryId, limit!);
  }
}
