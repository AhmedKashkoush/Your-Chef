import 'package:flutter/material.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class ChipLoading extends StatefulWidget {
  final int? initialDelay;
  const ChipLoading({Key? key, this.initialDelay}) : super(key: key);

  @override
  State<ChipLoading> createState() => _ChipLoadingState();
}

class _ChipLoadingState extends State<ChipLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _startAnimation();
    super.initState();
  }

  void _startAnimation() async {
    if (widget.initialDelay != null) {
      await Future.delayed(Duration(milliseconds: widget.initialDelay!));
    }
    setState(() {
      _controller
        ..forward()
        ..repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return FadeTransition(
            opacity: _animation,
            child: Chip(
              label: SizedBox(
                width: 80,
              ),
              backgroundColor: AppColors.appBarIconColors,
            ),
          );
        });
  }
}
