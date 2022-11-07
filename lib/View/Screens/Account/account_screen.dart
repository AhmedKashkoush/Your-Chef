import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Account/account_controller.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Widgets/AppBars/transparent_app_bar.dart';
import 'package:your_chief/View/Widgets/Avatars/custom_profile_avatar.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';
import 'package:your_chief/View/Widgets/Buttons/tile_button.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';
import 'package:your_chief/View/Widgets/Icons/badge_icon.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (controller) {
      return Scaffold(
        key: controller.accountKey,
        appBar: TransparentAppBar(
          leading: IconButton(
            icon: BadgeIcon(
              icon: Icons.filter_list_outlined,
              position: BadgePosition.topEnd(top: 0, end: -2),
            ),
            onPressed: controller.openDrawer,
          ),
          foregroundColor: AppColors.appBarIconColors,
        ),
        drawer: MainDrawer(currentPage: MainDrawerPage.account),
        body: const OrientationWidget(
          portrait: _AccountScreenPortrait(),
          landscape: _AccountScreenLandscape(),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 14,
        //     vertical: 12.0,
        //   ),
        //   child: PrimaryButton(
        //     text: 'Log Out',
        //     color: AppColors.dangerColor,
        //     onPressed: () {
        //       controller.logout(context);
        //     },
        //   ),
        // ),
      );
    });
  }
}

class _AccountScreenPortrait extends StatelessWidget {
  const _AccountScreenPortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<AccountController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'profile-photo',
                  child: Material(
                    type: MaterialType.transparency,
                    child: CustomProfileAvatar(
                      name: controller.currentUser!.name,
                      color: AppColors.primary,
                      showDot: false,
                      radius: 64,
                      onTap: controller.onPhotoTap,
                      image: controller.currentUser!.image == null
                          ? null
                          : CachedNetworkImageProvider(
                              "${controller.currentUser!.image!}",
                              headers: ApiHeaders.authHeaders,
                              cacheKey: controller.currentUser!.image!,
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentUser!.name,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          //style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.currentUser!.email,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              itemCount: controller.options.length,
              itemBuilder: (BuildContext context, int index) {
                return TileButton(
                  title: controller.options[index].name.tr,
                  icon: controller.options[index].icon,
                  iconColor: controller.options[index].color,
                  titleColor: controller.options[index].color,
                  onTap: () {
                    controller.toOption(
                      controller.options[index].option,
                      context,
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            child: PrimaryButton(
              text: AppTranslationKeys.logout.tr,
              color: AppColors.dangerColor,
              onPressed: () {
                controller.logout(context);
              },
            ),
          ),
        ],
      );
    });
  }
}

class _AccountScreenLandscape extends StatelessWidget {
  const _AccountScreenLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<AccountController>(builder: (controller) {
      return Column(
        children: [
          ListTile(
            horizontalTitleGap: 10,
            leading: Hero(
              tag: 'profile-photo',
              child: Material(
                type: MaterialType.transparency,
                child: CustomProfileAvatar(
                  name: controller.currentUser!.name,
                  color: AppColors.primary,
                  showDot: false,
                  radius: 34,
                  onTap: controller.onPhotoTap,
                  image: controller.currentUser!.image == null
                      ? null
                      : CachedNetworkImageProvider(
                          "${controller.currentUser!.image!}",
                          headers: ApiHeaders.authHeaders,
                          cacheKey: controller.currentUser!.image!,
                        ),
                ),
              ),
            ),
            title: Text(
              controller.currentUser!.name,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              //style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              controller.currentUser!.email,
              overflow: TextOverflow.ellipsis,
            ),
            tileColor: Theme.of(context).scaffoldBackgroundColor,
            trailing: TextButton.icon(
              onPressed: () {
                controller.logout(context);
              },
              icon: Icon(
                Ionicons.log_out_outline,
                color: AppColors.dangerColor,
              ),
              label: Text(
                AppTranslationKeys.logout.tr,
                style: const TextStyle(
                  color: AppColors.dangerColor,
                ),
              ),
              style: TextButton.styleFrom(
                primary: AppColors.dangerColor,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              itemCount: controller.options.length,
              itemBuilder: (BuildContext context, int index) {
                return TileButton(
                  title: controller.options[index].name.tr,
                  icon: controller.options[index].icon,
                  iconColor: controller.options[index].color,
                  titleColor: controller.options[index].color,
                  onTap: () {
                    controller.toOption(
                        controller.options[index].option, context);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 5);
              },
            ),
          ),
        ],
      );
    });
  }
}
