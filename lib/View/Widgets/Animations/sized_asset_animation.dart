import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SizedAssetAnimation extends StatelessWidget {
  final double size;
  final String url;
  const SizedAssetAnimation({Key? key, this.size = 250, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: RiveAnimation.asset(url),
    );
  }
}
