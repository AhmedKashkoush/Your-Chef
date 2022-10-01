import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/View/Widgets/custom_main_bottom_bar.dart';
import 'package:your_chief/View/Widgets/custom_search_bar.dart';
import 'package:your_chief/View/Widgets/title_widget.dart';

import '../../Widgets/custom_profile_avatar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        key: controller.homeKey,
        drawer: SafeArea(
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.horizontal(
                end: Radius.circular(24),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DrawerHeader(
                    //decoration: BoxDecoration(color: AppColors.primary,),
                    child: SizedBox(
                      height: 450,
                      child: Center(
                        child: Image.asset(
                          AppImages.yourChief,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        body: NestedScrollView(
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
                snap: true,
                floating: true,
                pinned: true,
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
                      // image: AssetImage(
                      //   controller.currentUser!.image!,
                      // ),
                      // image: CachedNetworkImageProvider(
                      //   "http://192.168.1.6:8000/${controller.currentUser!.image!}",
                      //   headers: ApiHeaders.authHeaders,
                      //   //cacheKey: controller.currentUser!.image!,
                      // ),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: const CustomSearchBar(
                    hint: 'Search',
                    hintStyle: const TextStyle(
                      color: AppColors.appBarIconColors,
                      fontWeight: FontWeight.bold,
                    ),
                    prefix: Icon(
                      Ionicons.search_outline,
                      color: AppColors.appBarIconColors,
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              // PreferredSize(
              //   preferredSize: Size.fromHeight(kToolbarHeight),
              //   child: const CustomSearchBar(
              //     hint: 'Search',
              //     hintStyle: const TextStyle(
              //       color: AppColors.appBarIconColors,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     prefix: Icon(
              //       Ionicons.search_outline,
              //       color: AppColors.appBarIconColors,
              //     ),
              //   ),
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
