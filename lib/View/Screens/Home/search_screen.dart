import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/search_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/TextFields/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: GetBuilder<SearchScreenController>(builder: (controller) {
            return Column(children: [
              Hero(
                tag: 'home search',
                child: Material(
                  type: MaterialType.transparency,
                  child: CustomSearchBar(
                    hint: AppTranslationKeys.search.tr,
                    hintStyle: const TextStyle(
                      color: AppColors.appBarIconColors,
                      fontWeight: FontWeight.bold,
                    ),
                    readOnly: false,
                    controller: controller.searchController,
                    onSubmitted: controller.search,
                    suffix: !controller.showClear
                        ? IconButton(
                            icon: Icon(Ionicons.mic_outline),
                            onPressed: controller.toVoiceSearch,
                            color: AppColors.appBarIconColors,
                          )
                        : IconButton(
                            icon: Icon(Icons.close),
                            onPressed: controller.clear,
                            color: AppColors.appBarIconColors,
                          ),
                    prefix: !canPop
                        ? null
                        : IconButton(
                            icon: Icon(Icons.adaptive.arrow_back),
                            onPressed: controller.back,
                            color: AppColors.appBarIconColors,
                          ),
                  ),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}
