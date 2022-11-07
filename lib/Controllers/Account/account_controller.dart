import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Model/Models/user_model.dart';
import 'package:your_chief/Model/Web%20Services/user_api.dart';
import 'package:your_chief/View/Widgets/Avatars/rounded_avatar.dart';

import '../../Model/Repository/Repositories/user_repository.dart';
import '../../View/Models/Account/account_item.dart';

class AccountController extends GetxController {
  final GlobalKey<ScaffoldState> accountKey = GlobalKey<ScaffoldState>();
  final UserModel? currentUser = CurrentUser.user;
  final UserRepository _user = UserRepository(UserApi());

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<AccountItem> options = [
    AccountItem(
      name: 'Security',
      icon: Ionicons.lock_closed_outline,
      option: AccountOptions.security,
    ),
    AccountItem(
      name: 'Edit Profile',
      icon: Icons.mode_edit_outlined,
      option: AccountOptions.editProfile,
    ),
    AccountItem(
      name: 'Switch Account',
      icon: Icons.switch_account_outlined,
      option: AccountOptions.switchAccount,
    ),
    AccountItem(
      name: 'Notifications',
      icon: Ionicons.notifications_outline,
      option: AccountOptions.notifications,
    ),
    AccountItem(
      name: 'Online Status',
      icon: Icons.online_prediction_outlined,
      option: AccountOptions.onlineStatus,
    ),
    AccountItem(
      name: 'Orders History',
      icon: Icons.history_outlined,
      option: AccountOptions.ordersHistory,
    ),
    AccountItem(
      name: 'Change Password',
      icon: Ionicons.key_outline,
      option: AccountOptions.changePassword,
    ),
    AccountItem(
      name: 'Local Backup',
      icon: Ionicons.sync_outline,
      option: AccountOptions.localBackup,
    ),
    AccountItem(
      name: 'Delete',
      icon: Icons.delete_forever_outlined,
      option: AccountOptions.delete,
      color: AppColors.dangerColor,
    ),
  ];
  void openDrawer() {
    accountKey.currentState?.openDrawer();
  }

  void toOption(AccountOptions option, BuildContext context) {
    switch (option) {
      case AccountOptions.security:
        break;
      case AccountOptions.editProfile:
        break;
      case AccountOptions.switchAccount:
        break;
      case AccountOptions.notifications:
        break;
      case AccountOptions.onlineStatus:
        break;
      case AccountOptions.ordersHistory:
        break;
      case AccountOptions.changePassword:
        break;
      case AccountOptions.localBackup:
        break;
      case AccountOptions.delete:
        _deleteAccout(context);
        break;
    }
  }

  void logout(BuildContext context) async {
    if (_isLoading) return;
    _isLoading = true;
    Utils.showLoadingDialog(AppTranslationKeys.loggingOut.tr);
    dynamic _data = await _user.logout(CurrentUser.token!);
    Get.back();
    _isLoading = false;
    if (_data != null) {
      if (_data is ApiMessages) {
        Utils.showSnackBarMessage(
          _data.message,
          context,
          messageType: MessageType.error,
        );
      } else {
        Utils.showSnackBarMessage(
          AppTranslationKeys.youLoggedOut.tr,
          context,
          messageType: MessageType.success,
        );
        Get.offNamed(AppRouteNames.auth);
      }
    } else {
      Utils.showSnackBarMessage(
        AppTranslationKeys.somethingWentWrong.tr,
        context,
        messageType: MessageType.error,
      );
    }
  }

  void _deleteAccout(BuildContext context) async {
    if (_isLoading) return;
    bool confirm = await Get.defaultDialog<bool>(
          title: AppTranslationKeys.warning.tr,
          radius: 25,
          middleText: AppTranslationKeys.warningMessage.tr,
          titleStyle: const TextStyle(
            color: AppColors.dangerColor,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(20),
          onCancel: () {},
          onConfirm: () {
            Get.back<bool>(result: true);
          },
        ) ??
        false;
    if (!confirm) return;
    _isLoading = true;
    Utils.showLoadingDialog(AppTranslationKeys.pleaseWait.tr);
    dynamic _data = await _user.deleteUser(CurrentUser.token!);
    Get.back();
    _isLoading = false;

    if (_data != null) {
      if (_data is ApiMessages) {
        Utils.showSnackBarMessage(
          _data.message,
          context,
          messageType: MessageType.error,
        );
      } else {
        Utils.showSnackBarMessage(
          AppTranslationKeys.accountDeleted.tr,
          context,
          messageType: MessageType.success,
        );
        Get.offNamed(AppRouteNames.auth);
      }
    } else {
      Utils.showSnackBarMessage(
        AppTranslationKeys.somethingWentWrong.tr,
        context,
        messageType: MessageType.error,
      );
    }
  }

  void onPhotoTap() {
    if (currentUser!.image == null) return;
    Get.dialog(Hero(
      tag: 'profile-photo',
      child: Material(
        type: MaterialType.transparency,
        child: RoundedAvatar(
          imageUrl: currentUser!.image!,
        ),
      ),
    ));
  }
}

enum AccountOptions {
  security,
  editProfile,
  switchAccount,
  notifications,
  onlineStatus,
  ordersHistory,
  changePassword,
  localBackup,
  delete
}
