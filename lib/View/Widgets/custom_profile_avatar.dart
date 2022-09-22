import 'package:flutter/material.dart';

class CustomProfileAvatar extends StatelessWidget {
  final String name;
  final Color color;
  final ImageProvider? image;
  final double radius;
  const CustomProfileAvatar({
    Key? key,
    required this.name,
    required this.color,
    this.image,
    this.radius = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _name = name.split(' ');
    String displayName = '';
    _name.forEach((name) {
      if (displayName.length < 3) {
        displayName += name.characters.first;
      }
    });
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      foregroundImage: image,
      child: image != null
          ? null
          : Text(
              displayName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
    );
  }
}
