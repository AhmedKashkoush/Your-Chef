class FoodModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String restaurant;
  final String restaurantImageUrl;
  final double rate;
  final int stock;
  final bool hasOffer;
  final double? oldPrice;
  final bool isFavourite;

  const FoodModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.restaurant,
    required this.restaurantImageUrl,
    required this.rate,
    this.stock = 0,
    this.hasOffer = false,
    this.oldPrice,
    this.isFavourite = false,
  });

  FoodModel fromJson(Map<String, dynamic> json) => FoodModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        restaurant: json['restaurant'],
        restaurantImageUrl: json['restaurantImageUrl'],
        rate: json['rate'],
        stock: json['stock'],
        hasOffer: json['hasOffer'] ?? false,
        oldPrice: json['oldPrice'],
        isFavourite: json['isFavourite'] ?? false,
      );

  Map<String, dynamic> toJson(FoodModel model) => <String, dynamic>{
        'name': model.name,
        'description': model.description,
        'price': model.price,
        'imageUrl': model.imageUrl,
        'restaurant': model.restaurant,
        'restaurantImageUrl': model.restaurantImageUrl,
        'rate': model.rate,
        'stock': model.stock,
        'hasOffer': model.hasOffer,
        'oldPrice': model.oldPrice,
        'isFavourite': model.isFavourite,
      };
}
