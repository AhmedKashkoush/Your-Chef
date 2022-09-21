import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class CustomBorderedAvatar extends StatelessWidget {
  final Color? borderColor;
  final Color? color;
  final Widget? child;
  final Color? foregroundColor;
  final ImageProvider? image;
  final double? strokeWidth;
  final double radius;
  const CustomBorderedAvatar({
    Key? key,
    this.borderColor,
    this.color,
    this.child,
    this.foregroundColor,
    this.image,
    this.strokeWidth,
    this.radius = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Theme.of(context).primaryColor,
          width: strokeWidth ?? 3,
        ),
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
        color: color ??
            AppColors.photoSectionAvatar
                .withOpacity(AppColors.photoSectionAvatarOpacity),
      ),
      foregroundDecoration: BoxDecoration(color: foregroundColor),
      child: child != null && image == null
          ? Center(
              child: child,
            )
          : null,
    );
  }
}
