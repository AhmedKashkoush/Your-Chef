import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class OnlineDot extends StatelessWidget {
  final double radius;
  final bool isOnline;
  const OnlineDot({Key? key, this.radius = 7, this.isOnline = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundColor:
            isOnline ? AppColors.onlineDotColor : AppColors.offlineDotColor,
      ),
    );
  }
}
