import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Core/Utils/api_messages.dart';
import 'package:your_chief/Core/Utils/utils.dart';
import 'package:your_chief/Model/Repositories/Repositories/auth_repository.dart';
import 'package:your_chief/Model/Web%20Services/auth_api.dart';

class AddProfilePhotoController extends GetxController {
  late dynamic args;
  File? photo;
  final ImagePicker _picker = ImagePicker();
  final AuthRepository _photoApi = AuthRepository(AuthApi());

  bool _isLoading = false;
  @override
  void onInit() {
    args = Get.arguments;
    super.onInit();
  }

  void uploadPhoto() {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Ionicons.camera_outline),
            title: Text(
              AppTranslationKeys.camera.tr,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            iconColor: Colors.white,
            textColor: Colors.white,
            onTap: () => _chooseSource(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Ionicons.images_outline),
            title: Text(
              AppTranslationKeys.gallery.tr,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            iconColor: Colors.white,
            textColor: Colors.white,
            onTap: () => _chooseSource(ImageSource.gallery),
          ),
        ],
      ),
      isScrollControlled: true,
      backgroundColor: AppColors.primary,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
    );
  }

  void _chooseSource(ImageSource source) async {
    XFile? _pickedImage = await _picker.pickImage(source: source);
    if (_pickedImage != null) {
      photo = File(_pickedImage.path);
      update();
    }
    Get.back();
  }

  void resetPhoto() {
    photo = null;
    update();
  }

  void skipStep(BuildContext context) async {
    if (photo != null) {
      args['photo'] = photo;
      if (!_isLoading)
        Utils.showLoadingDialog(AppTranslationKeys.pleaseWait.tr);
      _isLoading = true;
      dynamic _data = await _photoApi.uploadPhoto(
        args['email'].trim(),
        photo!,
      );
      Get.back();
      _isLoading = false;

      if (_data != null) {
        if (_data is ApiMessages) {
          Utils.showSnackBarMessage(
            _data.message,
            context,
            messageType: MessageType.error,
            borderRadius: 15,
          );
        } else
          Get.offNamed(AppRouteNames.registerVerify, arguments: args);
      } else {
        Utils.showSnackBarMessage(
          AppTranslationKeys.somethingWentWrong.tr,
          context,
          messageType: MessageType.error,
          borderRadius: 15,
        );
      }
    } else
      Get.offNamed(AppRouteNames.registerVerify, arguments: args);
  }
}
