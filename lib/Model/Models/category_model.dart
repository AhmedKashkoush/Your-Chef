class CategoryModel {
  final int id;
  final String name;

  const CategoryModel({required this.id, required this.name});

  static CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json['id'], name: json['name']);
  }

  static Map<String, dynamic> tomJson(CategoryModel model) {
    return {
      'id': model.id,
      'name': model.name,
    };
  }
}
