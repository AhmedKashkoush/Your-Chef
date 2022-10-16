import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';

class ConnectivityBanner extends StatefulWidget {
  final bool isOnline;
  const ConnectivityBanner({Key? key, required this.isOnline})
      : super(key: key);

  @override
  State<ConnectivityBanner> createState() => _ConnectivityBannerState();
}

class _ConnectivityBannerState extends State<ConnectivityBanner> {
  bool isExpanded = false;
  double expansionHeight = 30;
  final Duration duration = Duration(milliseconds: 400);
  final Duration timeOut = Duration(seconds: 4);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        isExpanded = true;
      });
      Future.delayed(timeOut, () {
        setState(() {
          isExpanded = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isExpanded ? expansionHeight : 0,
      duration: duration,
      alignment: Alignment.center,
      color: widget.isOnline
          ? AppColors.onlineDotColor
          : AppColors.offlineDotColor,
      child: Text(
        widget.isOnline
            ? AppTranslationKeys.online.tr
            : AppTranslationKeys.checkIntenet.tr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
