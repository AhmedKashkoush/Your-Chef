import 'package:your_chief/Model/Models/restaurant_model.dart';

class FoodModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final RestaurantModel restaurant;
  final double rate;
  final int stock;
  final bool hasOffer;
  final double? oldPrice;
  final bool isFavourite;

  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.restaurant,
    required this.rate,
    this.stock = 0,
    this.hasOffer = false,
    this.oldPrice,
    this.isFavourite = false,
  });

  static FoodModel fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: double.parse(json['price']),
        imageUrl: json['image'],
        restaurant: RestaurantModel.fromJson(json['restaurant']),
        rate: double.parse(json['rate']),
        stock: json['stock'],
        hasOffer: false, //json['hasOffer'] ?? false,
        oldPrice: 0, //json['oldPrice'] ?? 0,
        isFavourite: false, //json['isFavourite'] ?? false,
      );

  static Map<String, dynamic> toJson(FoodModel model) => <String, dynamic>{
        'id': model.id,
        'name': model.name,
        'description': model.description,
        'price': model.price,
        'imageUrl': model.imageUrl,
        'restaurant': RestaurantModel.toJson(model.restaurant),
        'rate': model.rate,
        'stock': model.stock,
        'hasOffer': model.hasOffer,
        'oldPrice': model.oldPrice,
        'isFavourite': model.isFavourite,
      };
}
