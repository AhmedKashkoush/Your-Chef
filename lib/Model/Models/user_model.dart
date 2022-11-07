class UserModel {
  final String name;
  final String gender;
  final String email;
  final String phone;
  final String? image;
  final bool isOnline;
  final int notifications;
  final int homeNotifications;

  UserModel({
    required this.name,
    required this.gender,
    required this.email,
    required this.phone,
    this.image,
    this.isOnline = false,
    this.notifications = 0,
    this.homeNotifications = 0,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      gender: json['gender'] == 1 ? 'male' : 'female',
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      isOnline: json['online_status'] == null
          ? false
          : json['online_status'] == 'Online',
      notifications: json['notifications'] ?? 0,
      homeNotifications: json['home_notifications'] ?? 0,
    );
  }

  static Map<String, dynamic> toJson(UserModel model) {
    return {
      'name': model.name,
      'gender': model.gender == 'male' ? 1 : 2,
      'email': model.email,
      'phone': model.phone,
      'image': model.image,
      'online_status': model.isOnline ? 1 : 0,
      'notifications': model.notifications,
      'home_notifications': model.homeNotifications,
    };
  }
}
