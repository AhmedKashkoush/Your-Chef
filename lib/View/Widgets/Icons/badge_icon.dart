import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class BadgeIcon extends StatelessWidget {
  final IconData icon;
  final Widget? content;
  final Color? badgeColor;
  final double padding;
  final BadgePosition? position;
  final BadgeAnimationType animationType;
  const BadgeIcon({
    Key? key,
    required this.icon,
    this.content,
    this.badgeColor,
    this.padding = 5.0,
    this.position,
    this.animationType = BadgeAnimationType.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      child: Icon(icon),
      position: position,
      animationType: animationType,
      padding: EdgeInsets.all(padding),
      badgeColor: badgeColor ?? AppColors.badgeColor,
      badgeContent: content,
    );
  }
}
