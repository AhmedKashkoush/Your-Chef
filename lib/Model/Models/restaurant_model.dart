class RestaurantModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final String phone;
  final double rate;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.phone,
    required this.rate,
  });

  static RestaurantModel fromJson(Map<String, dynamic> json) => RestaurantModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        phone: json['phone'],
        rate: double.parse(json['rate']),
      );

  static Map<String, dynamic> toJson(RestaurantModel model) =>
      <String, dynamic>{
        'id': model.id,
        'name': model.name,
        'description': model.description,
        'image': model.image,
        'phone': model.phone,
        'rate': model.rate,
      };
}
