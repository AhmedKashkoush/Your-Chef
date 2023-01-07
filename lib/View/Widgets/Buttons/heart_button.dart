import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;
  final Color? color;
  final Color? likedColor;
  final double? iconSize;
  final bool isFavourite;
  const HeartButton({
    Key? key,
    this.onTap,
    this.color,
    this.likedColor,
    this.iconSize,
    this.isFavourite = false,
  }) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  late bool _isFavourite;
  @override
  void initState() {
    _isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        onPressed: widget.onTap == null
            ? null
            : () {
                widget.onTap!.call();
                setState(() {
                  _isFavourite = !_isFavourite;
                });
              },
        icon: _isFavourite
            ? Icon(Ionicons.heart,
                color: widget.likedColor ?? AppColors.badgeColor)
            : Icon(
                Ionicons.heart_outline,
                color: widget.color,
              ),
      ),
    );
  }
}
