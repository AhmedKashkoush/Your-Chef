import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/food_view_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/View/Widgets/Cards/food_card.dart';
import 'package:your_chief/View/Widgets/Cards/offer_widget.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return GetBuilder<FoodViewController>(builder: (controller) {
      return SafeArea(
        bottom: false,
        child: Column(
          children: [
            ListTile(
              title: Text(
                AppTranslationKeys.foods.tr,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: controller.toggleGrid,
                icon: Icon(
                  controller.isGrid
                      ? Ionicons.list_outline
                      : Ionicons.grid_outline,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) {
                  return ChoiceChip(
                    label: Text(
                      controller.categories[index],
                    ),
                    selected: controller.selectedCategory == index,
                    selectedColor: AppColors.secondary.withOpacity(0.5),
                    labelStyle: TextStyle(
                      color: controller.selectedCategory == index
                          ? AppColors.primary
                          : Colors.grey,
                      fontWeight: controller.selectedCategory == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    onSelected: (_) {
                      controller.selectCategory(index);
                    },
                  );
                },
              ),
            ),
            Expanded(
              //flex: 4,
              child: controller.selectedCategory != 0 &&
                      controller.foodsFiltered.length == 0
                  ? Center(
                      child: Text(
                        AppTranslationKeys.noResults.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: controller.refreshData,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: controller.isGrid
                            ? Material(
                                key: ValueKey<String>('grid'),
                                child: GridView.builder(
                                  key: PageStorageKey('food-all-category'),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: isLandscape ? 3 : 2,
                                    mainAxisSpacing: 1,
                                    childAspectRatio: isLandscape ? 1.1 : 0.75,
                                  ),
                                  padding: const EdgeInsets.only(
                                      right: 12, left: 12, bottom: 100),
                                  itemCount: controller.selectedCategory != 0
                                      ? controller.foodsFiltered.length
                                      : controller.foods.length,
                                  itemBuilder: (context, index) {
                                    final FoodModel model =
                                        controller.selectedCategory != 0
                                            ? controller.foodsFiltered[index]
                                            : controller.foods[index];
                                    if (model.hasOffer &&
                                        model.oldPrice != null)
                                      return OfferWidget(
                                        sale: model.price.ceil() /
                                            model.oldPrice!,
                                        child: FoodCard(
                                          model: model,
                                          onTap: controller.preview,
                                          isListTile: false,
                                          onFavouriteTap: () {
                                            controller.setFavouriteAt(
                                              context,
                                              model,
                                              index,
                                              !model.isFavourite,
                                            );
                                          },
                                        ),
                                      );
                                    return FoodCard(
                                      model: model,
                                      onTap: controller.preview,
                                      isListTile: false,
                                      onFavouriteTap: () {
                                        controller.setFavouriteAt(
                                          context,
                                          model,
                                          index,
                                          !model.isFavourite,
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            : Material(
                                key: ValueKey<String>('list'),
                                child: ListView.builder(
                                  key: PageStorageKey('food-all-category'),
                                  padding: const EdgeInsets.only(
                                      right: 12, left: 12, bottom: 100),
                                  itemCount: controller.selectedCategory != 0
                                      ? controller.foodsFiltered.length
                                      : controller.foods.length,
                                  itemBuilder: (context, index) {
                                    final FoodModel model =
                                        controller.selectedCategory != 0
                                            ? controller.foodsFiltered[index]
                                            : controller.foods[index];
                                    if (model.hasOffer &&
                                        model.oldPrice != null)
                                      return OfferWidget(
                                        sale: model.price.ceil() /
                                            model.oldPrice!,
                                        child: FoodCard(
                                          model: model,
                                          onTap: controller.preview,
                                          onFavouriteTap: () {
                                            controller.setFavouriteAt(
                                              context,
                                              model,
                                              index,
                                              !model.isFavourite,
                                            );
                                          },
                                        ),
                                      );
                                    return FoodCard(
                                      model: model,
                                      onTap: controller.preview,
                                      onFavouriteTap: () {
                                        controller.setFavouriteAt(
                                          context,
                                          model,
                                          index,
                                          !model.isFavourite,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                      ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
