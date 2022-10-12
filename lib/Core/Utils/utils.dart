import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
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
    double? borderRadius = 0,
    SnackBarAction? action,
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
            if (messageType != null)
              const SizedBox(
                width: 15,
              ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      messageType != MessageType.normal || messageType != null
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
                : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}

enum MessageType { success, error, normal, alert, notify }
enum VerificationFor { account, resetPassword, changePassword }
