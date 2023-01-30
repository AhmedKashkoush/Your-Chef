abstract class IFoodRepository {
  Future? getAllFoods(String token, int page, [int? limit]);
  Future? getFoodsWithCategory(String token, int page, int categoryId,
      [int? limit]);
  Future? getFoodsFromRestaurant(String token, int page, int restaurantId,
      [int? limit]);
}
