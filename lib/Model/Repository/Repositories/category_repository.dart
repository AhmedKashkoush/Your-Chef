import 'package:your_chief/Model/Repository/Structure/category_structure.dart';

class CategoryRepository implements ICategoryRepository {
  final ICategoryRepository repository;

  const CategoryRepository(this.repository);
  @override
  Future? getCategories(String token, [int? limit, int? page]) async {
    return await repository.getCategories(token, limit, page);
  }
}
