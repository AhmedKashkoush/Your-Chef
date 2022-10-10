import 'package:flutter/material.dart';
import 'package:your_chief/View/Widgets/Other/online_dot.dart';

class CustomProfileAvatar extends StatelessWidget {
  final String name;
  final Color color;
  final ImageProvider? image;
  final double radius;
  final bool showDot;
  final bool isOnline;
  const CustomProfileAvatar({
    Key? key,
    required this.name,
    required this.color,
    this.image,
    this.radius = 18,
    this.showDot = true,
    this.isOnline = false,
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
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: image == null ? color : Colors.grey.shade500,
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
    );
  }
}
