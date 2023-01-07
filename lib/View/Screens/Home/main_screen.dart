import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/main_screen_controller.dart';
import 'package:your_chief/Controllers/Other/main_drawer_controller.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Core/Services/connectivity_service.dart';
import 'package:your_chief/View/Widgets/BottomBars/custom_main_bottom_bar.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';
import 'package:your_chief/View/Widgets/Icons/badge_icon.dart';
import 'package:your_chief/View/Widgets/TextFields/custom_search_bar.dart';
import 'package:your_chief/View/Widgets/Texts/title_widget.dart';

import '../../../Core/Utils/Options/main_drawer_pages.dart';
import '../../Widgets/Avatars/active_status_profile_avatar_listener.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const MainDrawerPage page = MainDrawerPage.main;

  @override
  Widget build(BuildContext context) {
    ConnectivityService _connection = Get.find();
    MainDrawerController _drawerController =
        Get.put(MainDrawerController(page: page));
    return GetBuilder<MainScreenController>(builder: (controller) {
      return WillPopScope(
        onWillPop: controller.onAppClose,
        child: Scaffold(
          key: controller.homeKey,
          extendBody: true,
          drawer: const MainDrawer(
            currentPage: page,
          ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const TitleWidget(),
                  centerTitle: true,
                  leading: IconButton(
                    icon: BadgeIcon(
                      icon: Icons.filter_list_outlined,
                      position: BadgePosition.topEnd(top: 0, end: -2),
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
                      icon: BadgeIcon(
                        icon: Ionicons.notifications_outline,
                        padding: 6,
                        position: BadgePosition.topEnd(end: -6),
                        content: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12,
                      ),
                      child: ActiveStatusProfileAvatarListener(
                        onlineStream: _connection.userStatusStream,
                        name: controller.currentUser!.name,
                        color: AppColors.primary,
                        onTap: _drawerController.toAccount,
                        image: controller.currentUser!.image == null
                            ? null
                            : CachedNetworkImageProvider(
                                "${controller.currentUser!.image!}",
                                headers: ApiHeaders.authHeaders,
                                cacheKey: controller.currentUser!.image!,
                              ),
                      ),
                      // child: StreamBuilder(
                      //     stream: _connection.userStatusStream,
                      //     builder: (context, AsyncSnapshot snapshot) {
                      //       return CustomProfileAvatar(
                      //         name: controller.currentUser!.name,
                      //         color: AppColors.primary,
                      //         isOnline: CurrentUser.isOnline,
                      //         onTap: _drawerController.toAccount,
                      //         image: controller.currentUser!.image == null
                      //             ? null
                      //             : CachedNetworkImageProvider(
                      //                 "${controller.currentUser!.image!}",
                      //                 headers: ApiHeaders.authHeaders,
                      //                 cacheKey: controller.currentUser!.image!,
                      //               ),
                      //       );
                      //     }),
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
                  child: Hero(
                    tag: 'home search',
                    child: Material(
                      type: MaterialType.transparency,
                      child: CustomSearchBar(
                        hint: AppTranslationKeys.search.tr,
                        hintStyle: const TextStyle(
                          color: AppColors.appBarIconColors,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: controller.onSearchTap,
                        prefix: Icon(
                          Ionicons.search_outline,
                          color: AppColors.appBarIconColors,
                        ),
                      ),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Transform.scale(
            scale: 1.3,
            child: FloatingActionButton(
              heroTag: 'cart',
              onPressed: () => controller.goToCart(context),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              child: Icon(
                Ionicons.cart_outline,
                size: 30,
              ),
            ),
          ),
          bottomNavigationBar: CustomMainBottomBar(
            selectedIndex: controller.currentPage,
            onTap: controller.changePage,
          ),
        ),
      );
    });
  }
}
