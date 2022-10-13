import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Model/Models/user_model.dart';

class AccountController extends GetxController {
  final GlobalKey<ScaffoldState> accountKey = GlobalKey<ScaffoldState>();
  final UserModel? currentUser = CurrentUser.currentUser;
  final List options = [
    {
      'name': 'Security',
      'icon': Ionicons.lock_closed_outline,
    },
    {
      'name': 'Edit Profile',
      'icon': Icons.mode_edit_outlined,
    },
    {
      'name': 'Switch Account',
      'icon': Icons.switch_account_outlined,
    },
    {
      'name': 'Notifications',
      'icon': Ionicons.notifications_outline,
    },
    {
      'name': 'Online Status',
      'icon': Icons.online_prediction_outlined,
    },
    {
      'name': 'Orders History',
      'icon': Icons.history_outlined,
    },
    {
      'name': 'Change Password',
      'icon': Ionicons.key_outline,
    },
    {
      'name': 'Local Backup',
      'icon': Ionicons.sync_outline,
    },
    {
      'name': 'Delete',
      'icon': Icons.delete_forever_outlined,
      'color': AppColors.dangerColor,
    },
  ];
  void openDrawer() {
    accountKey.currentState?.openDrawer();
  }

  void toOption(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
    }
  }

  void logout(BuildContext context) {}
}
