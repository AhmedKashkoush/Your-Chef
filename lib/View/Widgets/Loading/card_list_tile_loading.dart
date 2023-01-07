import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/View/Widgets/Avatars/rounded_avatar.dart';

class CardListTileLoading extends StatefulWidget {
  final int? initialDelay;
  const CardListTileLoading({Key? key, this.initialDelay}) : super(key: key);
  @override
  State<CardListTileLoading> createState() => _CardListTileLoadingState();
}

class _CardListTileLoadingState extends State<CardListTileLoading> {
  double _opacity = 0.5;
  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  void _startAnimation() async {
    if (widget.initialDelay != null) {
      _opacity = 0;
      await Future.delayed(Duration(milliseconds: widget.initialDelay!), () {
        setState(() {
          _opacity = 0.5;
        });
      });
    }
    Timer.periodic(const Duration(milliseconds: 800), (timer) {
      if (_opacity == 0.5) {
        setState(() {
          _opacity = 0.15;
        });
      } else {
        setState(() {
          _opacity = 0.5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.appBarIconColors.withOpacity(_opacity),
      ),
      child: Center(
        child: ListTile(
          leading: RoundedAvatar(
            color: AppColors.appBarIconColors.withOpacity(_opacity),
            width: 70,
            height: 70,
            radius: 15,
          ),
          title: RoundedAvatar(
            color: AppColors.appBarIconColors.withOpacity(_opacity),
            width: 80,
            height: 20,
            radius: 15,
          ),
          subtitle: Padding(
            padding: const EdgeInsetsDirectional.only(end: 50.0),
            child: RoundedAvatar(
              color: AppColors.appBarIconColors.withOpacity(_opacity),
              width: 50,
              height: 10,
              radius: 15,
            ),
          ),
        ),
      ),
    );
  }
}
