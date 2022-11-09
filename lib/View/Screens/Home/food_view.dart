import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/food_view_controller.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/View/Widgets/Cards/food_card.dart';
import 'package:your_chief/View/Widgets/Cards/offer_widget.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodViewController>(builder: (controller) {
      return SafeArea(
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
                onPressed: () {},
                icon: Icon(Ionicons.grid_outline),
              ),
            ),
            Expanded(
              child: ListView.builder(
                key: PageStorageKey('food-all-category'),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.foods.length,
                itemBuilder: (context, index) {
                  final FoodModel model = controller.foods[index];
                  if (model.hasOffer && model.oldPrice != null)
                    return OfferWidget(
                      sale: model.price.ceil() / model.oldPrice!,
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
          ],
        ),
      );
    });
  }
}
