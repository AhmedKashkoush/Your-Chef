import 'package:flutter/cupertino.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class OnboardingDot extends StatelessWidget {
  final bool selected;
  final void Function()? onTap;
  const OnboardingDot({
    Key? key,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  static final double _size = 10;
  static final double _selectedWidth = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: selected ? _selectedWidth : _size,
        height: _size,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.appBarIconColors,
          borderRadius: BorderRadius.circular(50),
        ),
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
