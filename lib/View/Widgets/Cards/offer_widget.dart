import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class OfferWidget extends StatelessWidget {
  final Widget child;
  final double sale;
  const OfferWidget({
    Key? key,
    required this.child,
    required this.sale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      type: MaterialType.transparency,
      child: Banner(
        location: BannerLocation.topStart,
        message: '${sale * 100}%',
        color: AppColors.badgeColor,
        child: child,
      ),
    );
  }
}
