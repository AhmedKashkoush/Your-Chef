import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class TileButton extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final IconData icon;
  final VoidCallback onTap;
  final Widget? action;
  final Color? iconColor;
  const TileButton({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    this.action,
    this.iconColor,
    this.titleColor,
    this.subtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: TextStyle(
                  color: subtitleColor,
                ),
              )
            : null,
        leading: Icon(
          icon,
          color: iconColor,
        ),
        trailing: action,
        onTap: onTap,
        tileColor: AppColors.buttonTilesColor
            .withOpacity(AppColors.buttonTilesOpacity),
        textColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
