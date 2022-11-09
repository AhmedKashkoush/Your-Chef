import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Other/main_drawer_controller.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/Core/Utils/Options/main_drawer_pages.dart';

class MainDrawer extends StatelessWidget {
  final MainDrawerPage currentPage;
  const MainDrawer({Key? key, required this.currentPage}) : super(key: key);

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
                itemCount: controller.pages.length,
                padding: const EdgeInsets.only(top: 12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 25),
                    child: Material(
                      child: ListTile(
                        title: Text(controller.pages[index].name.tr),
                        leading: Icon(
                          controller.pages[index].type == currentPage
                              ? controller.pages[index].activeIcon
                              : controller.pages[index].icon,
                        ),
                        onTap: () {
                          controller.to(controller.pages[index].type);
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
                        selected: controller.pages[index].type == currentPage,
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
