import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Auth/add_profile_photo_controller.dart';
import 'package:your_chief/View/Widgets/Buttons/outlined_primary_button.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';

import '../../../Core/Constants/app_translation_keys.dart';
import '../../Widgets/Avatars/custom_bordered_avatar.dart';

class AddProfilePhotoScreen extends StatelessWidget {
  const AddProfilePhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddProfilePhotoController>(builder: (controller) {
        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 150,
          ),
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: Theme.of(context).primaryColor,
            //       width: 4,
            //     ),
            //     color: AppColors.photoSectionAvatar
            //         .withOpacity(AppColors.photoSectionAvatarOpacity),
            //   ),
            //   child: Center(
            //     child: Icon(
            //       Ionicons.camera_outline,
            //       color: AppColors.photoSectionCamera.withOpacity(
            //         AppColors.photoSectionCameraOpacity,
            //       ),
            //     ),
            //   ),
            // ),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CustomBorderedAvatar(
                  image: controller.photo == null
                      ? null
                      : FileImage(controller.photo!),
                  child: Icon(
                    Ionicons.camera_outline,
                    size: 80,
                  ),
                ),
                if (controller.photo != null)
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 0,
                    end: context.isPortrait
                        ? Get.width * 0.12
                        : Get.width * 0.31,
                    child: ElevatedButton(
                      onPressed: controller.resetPhoto,
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.all(8),
                        elevation: 0,
                        shape: CircleBorder(),
                        side: BorderSide(
                          width: 3,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                      child: Icon(
                        Ionicons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              AppTranslationKeys.photoAlert.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 55,
            ),
            PrimaryButton(
              text: controller.photo == null
                  ? AppTranslationKeys.uploadAPhoto.tr
                  : AppTranslationKeys.uploadAnotherPhoto.tr,
              onPressed: controller.uploadPhoto,
            ),
            const SizedBox(
              height: 10,
            ),
            controller.photo == null
                ? OutlinedPrimaryButton(
                    text: AppTranslationKeys.skipThisStep.tr,
                    onPressed: () => controller.skipStep(context),
                  )
                : PrimaryButton(
                    text: AppTranslationKeys.continue_.tr,
                    onPressed: () => controller.skipStep(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      primary: Colors.green.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
