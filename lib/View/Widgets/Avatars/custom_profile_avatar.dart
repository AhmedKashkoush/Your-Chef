import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/View/Widgets/Other/online_dot.dart';

class CustomProfileAvatar extends StatelessWidget {
  final String name;
  final Color color;
  final ImageProvider? image;
  final double radius;
  final bool showDot;
  final bool isOnline;
  final VoidCallback? onTap;
  const CustomProfileAvatar({
    Key? key,
    required this.name,
    required this.color,
    this.image,
    this.radius = 18,
    this.showDot = true,
    this.isOnline = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (name.isNotEmpty) {
      final List<String> _name = name.split(' ');
      _name.forEach((name) {
        if (displayName.length < 3) {
          displayName += name.characters.first;
        }
      });
    }
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: image == null ? color : Colors.grey.shade500,
            foregroundImage: image,
            child: image != null
                ? null
                : displayName != ''
                    ? Text(
                        displayName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    : Icon(
                        Ionicons.person,
                        color: Colors.white30,
                        size: radius,
                      ),
          ),
          if (showDot)
            Positioned.directional(
              textDirection: Directionality.of(context),
              bottom: -1,
              end: -1,
              child: OnlineDot(
                isOnline: isOnline,
              ),
            ),
        ],
      ),
    );
  }
}
