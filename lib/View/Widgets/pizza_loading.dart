import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:your_chief/Core/Constants/app_svgs.dart';

class PizzaLoading extends StatefulWidget {
  const PizzaLoading({Key? key}) : super(key: key);

  @override
  State<PizzaLoading> createState() => _PizzaLoadingState();
}

class _PizzaLoadingState extends State<PizzaLoading>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotates;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _controller..repeat();
    _rotates = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotates,
      child: SvgPicture.asset(
        AppSVGs.pizza,
        color: Theme.of(context).primaryColor,
        width: 100,
        height: 100,
      ),
    );
  }
}
