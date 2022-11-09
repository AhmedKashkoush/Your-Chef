import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Utils/Options/message_types.dart';
import 'package:your_chief/View/Widgets/Loading/pizza_loading.dart';

class Utils {
  static void showLoadingDialog(String title) {
    Get.defaultDialog(
      title: title,
      content: const PizzaLoading(),
      barrierDismissible: false,
      onWillPop: () async => Future.value(false),
    );
  }

  static void showSnackBarMessage(
    String message,
    BuildContext context, {
    MessageType? messageType,
    double? borderRadius = 15,
    SnackBarAction? action,
    IconData? icon,
    Color? iconColor,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (messageType == MessageType.error)
              Icon(
                Ionicons.close_circle_outline,
                color: Colors.white,
              ),
            if (messageType == MessageType.success)
              Icon(
                Ionicons.checkmark_circle_outline,
                color: Colors.white,
              ),
            if (messageType == MessageType.online)
              Icon(
                Icons.wifi_outlined,
                color: Colors.white,
              ),
            if (messageType == MessageType.offline)
              Icon(
                Icons.wifi_off_outlined,
                color: Colors.white,
              ),
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
              ),
            if (messageType != null || icon != null)
              const SizedBox(
                width: 15,
              ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      messageType != MessageType.normal && messageType != null
                          ? Colors.white
                          : null,
                ),
              ),
            ),
          ],
        ),
        action: action,
        behavior: SnackBarBehavior.floating,
        backgroundColor: messageType == MessageType.error
            ? Colors.red
            : messageType == MessageType.success
                ? Colors.green
                : messageType == MessageType.online
                    ? AppColors.onlineDotColor
                    : messageType == MessageType.offline
                        ? AppColors.offlineDotColor
                        : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
