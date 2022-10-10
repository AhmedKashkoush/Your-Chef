import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/BottomBars/custom_main_bottom_bar.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';
import 'package:your_chief/View/Widgets/TextFields/custom_search_bar.dart';
import 'package:your_chief/View/Widgets/Texts/title_widget.dart';

import '../../Widgets/Avatars/custom_profile_avatar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        key: controller.homeKey,
        drawer: const MainDrawer(
          currentPage: MainDrawerPage.main,
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const TitleWidget(),
                centerTitle: true,
                leading: IconButton(
                  icon: Badge(
                    child: Icon(Icons.filter_list_outlined),
                    position: BadgePosition.topEnd(top: 0, end: -2),
                    animationType: BadgeAnimationType.scale,
                    badgeColor: AppColors.badgeColor,
                  ),
                  onPressed: controller.openDrawer,
                ),
                foregroundColor: AppColors.appBarIconColors,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                //snap: true,
                //floating: true,
                //pinned: true,
                actions: [
                  IconButton(
                    icon: Badge(
                      child: Icon(Ionicons.notifications_outline),
                      position: BadgePosition.topEnd(end: -6),
                      animationType: BadgeAnimationType.scale,
                      padding: const EdgeInsets.all(6),
                      badgeContent: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      badgeColor: AppColors.badgeColor,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 12,
                    ),
                    child: CustomProfileAvatar(
                      name: controller.currentUser!.name,
                      color: AppColors.primary,
                      isOnline: true,
                      image: controller.currentUser!.image == null
                          ? null
                          : CachedNetworkImageProvider(
                              "${controller.currentUser!.image!}",
                              headers: ApiHeaders.authHeaders,
                              cacheKey: controller.currentUser!.image!,
                            ),
                    ),
                  ),
                ],
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(kToolbarHeight),
                //   child: Expanded(
                //     child: const CustomSearchBar(
                //       hint: 'Search',
                //       hintStyle: const TextStyle(
                //         color: AppColors.appBarIconColors,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       prefix: Icon(
                //         Ionicons.search_outline,
                //         color: AppColors.appBarIconColors,
                //       ),
                //     ),
                //   ),
                // ),
              ),
              SliverToBoxAdapter(
                child: CustomSearchBar(
                  hint: AppTranslationKeys.search.tr,
                  hintStyle: const TextStyle(
                    color: AppColors.appBarIconColors,
                    fontWeight: FontWeight.bold,
                  ),
                  prefix: Icon(
                    Ionicons.search_outline,
                    color: AppColors.appBarIconColors,
                  ),
                ),
              )
              // SliverAppBar(
              //   title: Expanded(
              //     child: const CustomSearchBar(
              //       hint: 'Search',
              //       hintStyle: const TextStyle(
              //         color: AppColors.appBarIconColors,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       prefix: Icon(
              //         Ionicons.search_outline,
              //         color: AppColors.appBarIconColors,
              //       ),
              //     ),
              //   ),
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              // ),
            ];
          },
          body: controller.pages[controller.currentPage],
        ),
        bottomNavigationBar: CustomMainBottomBar(
          selectedIndex: controller.currentPage,
          onTap: controller.changePage,
        ),
      );
    });
  }
}
