abstract class ICategoryRepository {
  Future? getCategories(String token, [int? limit, int? page]);
}
