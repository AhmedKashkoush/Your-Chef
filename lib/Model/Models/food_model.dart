class FoodModel {
  final String name;
  final double price;
  final String imageUrl;
  final String restaurant;
  final String restaurantImageUrl;
  final double rate;
  final bool hasOffer;
  final double? oldPrice;
  final bool isFavourite;

  FoodModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.restaurant,
    required this.restaurantImageUrl,
    required this.rate,
    this.hasOffer = false,
    this.oldPrice,
    this.isFavourite = false,
  });

  FoodModel fromJson(Map<String, dynamic> json) => FoodModel(
        name: json['name'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        restaurant: json['restaurant'],
        restaurantImageUrl: json['restaurantImageUrl'],
        rate: json['rate'],
        hasOffer: json['hasOffer'] ?? false,
        oldPrice: json['oldPrice'],
        isFavourite: json['isFavourite'] ?? false,
      );

  Map<String, dynamic> toJson(FoodModel model) => <String, dynamic>{
        'name': model.name,
        'price': model.price,
        'imageUrl': model.imageUrl,
        'restaurant': model.restaurant,
        'restaurantImageUrl': model.restaurantImageUrl,
        'rate': model.rate,
        'hasOffer': model.hasOffer,
        'oldPrice': model.oldPrice,
        'isFavourite': model.isFavourite,
      };
}
