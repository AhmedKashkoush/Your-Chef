import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Other/main_drawer_controller.dart';
import 'package:your_chief/Core/Constants/app_images.dart';

class MainDrawer extends StatelessWidget {
  final MainDrawerPage currentPage;
  const MainDrawer({Key? key, required this.currentPage}) : super(key: key);

  static const _pages = [
    {
      'name': 'Home Page',
      'icon': Ionicons.home_outline,
      'active_icon': Ionicons.home,
      'type': MainDrawerPage.main,
    },
    {
      'name': 'Account',
      'icon': Ionicons.person_circle_outline,
      'active_icon': Ionicons.person_circle,
      'type': MainDrawerPage.account,
    },
    {
      'name': 'Restaurants Places',
      'icon': Ionicons.location_outline,
      'active_icon': Ionicons.location,
      'type': MainDrawerPage.map,
    },
    {
      'name': 'Security',
      'icon': Ionicons.shield_outline,
      'active_icon': Ionicons.shield,
      'type': MainDrawerPage.security,
    },
    {
      'name': 'Policy and Terms',
      'icon': Icons.policy_outlined,
      'active_icon': Icons.policy,
      'type': MainDrawerPage.policy,
    },
    {
      'name': 'Licenses',
      'icon': Ionicons.clipboard_outline,
      'active_icon': Ionicons.clipboard,
      'type': MainDrawerPage.licenses,
    },
    {
      'name': 'Ads',
      'icon': Icons.monetization_on_outlined,
      'active_icon': Icons.monetization_on,
      'type': MainDrawerPage.ads,
    },
    {
      'name': 'Settings',
      'icon': Ionicons.settings_outline,
      'active_icon': Ionicons.settings,
      'type': MainDrawerPage.settings,
    },
    {
      'name': 'About App',
      'icon': Ionicons.information_circle_outline,
      'active_icon': Ionicons.information_circle,
      'type': MainDrawerPage.about,
    },
  ];

  @override
  Widget build(BuildContext context) {
    MainDrawerController controller =
        Get.put(MainDrawerController(page: this.currentPage));
    return SafeArea(
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
              // decoration: BoxDecoration(
              //   color: Theme.of(context).scaffoldBackgroundColor,
              //   borderRadius: BorderRadiusDirectional.only(
              //     topEnd: Radius.circular(24),
              //   ),
              // ),
              child: SizedBox(
                height: 450,
                child: Center(
                  child: Image.asset(
                    AppImages.yourChef,
                    height: 200,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _pages.length,
                padding: const EdgeInsets.only(top: 12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 25),
                    child: Material(
                      child: ListTile(
                        title: Text(_pages[index]['name'].toString()),
                        leading: Icon(
                          _pages[index]['type'] == currentPage
                              ? _pages[index]['active_icon'] as IconData
                              : _pages[index]['icon'] as IconData,
                        ),
                        onTap: () {
                          controller
                              .to(_pages[index]['type'] as MainDrawerPage);
                        },
                        horizontalTitleGap: 18,
                        iconColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                        textColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                        selectedColor: Theme.of(context)
                            .primaryColor, //Theme.of(context).scaffoldBackgroundColor,
                        selectedTileColor:
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        selected: _pages[index]['type'] == currentPage,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            bottomEnd: Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index == 6)
                    return const Divider(
                      indent: 12,
                      endIndent: 48,
                      thickness: 1,
                    );
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum MainDrawerPage {
  main,
  map,
  settings,
  account,
  security,
  policy,
  about,
  licenses,
  ads,
}
