class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? image;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      this.image});

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  static Map<String, dynamic> toJson(UserModel model) {
    return {
      'name': model.name,
      'email': model.email,
      'phone': model.phone,
      'image': model.image,
    };
  }
}
