import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/Food%20Details/food_details_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/Avatars/rounded_avatar.dart';
import 'package:your_chief/View/Widgets/Buttons/primary_button.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double toolBarHeight = MediaQuery.of(context).size.height * 0.30;
    return GetBuilder<FoodDetailsController>(builder: (controller) {
      return SafeArea(
        bottom: false,
        child: Scaffold(
          body: CustomScrollView(
            controller: controller.listController,
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                stretch: true,
                primary: true,
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: !controller.showTitle ? 0 : 1,
                  child: Row(
                    children: [
                      RoundedAvatar(
                        imageUrl: controller.food.imageUrl,
                        isAsset: true,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(controller.food.name),
                    ],
                  ),
                ),
                actions: [
                  Hero(
                    tag: '${controller.index}favourite',
                    child: Material(
                      type: MaterialType.transparency,
                      child: IconButton(
                        onPressed: //widget.onFavouriteTap == null
                            //? null
                            //:
                            () {
                          // widget.onFavouriteTap!.call();
                          // setState(() {
                          //   isFavourite = !isFavourite;
                          //});
                        },
                        icon: controller.food.isFavourite
                            ? Icon(
                                Ionicons.heart,
                                color: AppColors.badgeColor,
                              )
                            : Icon(
                                Ionicons.heart_outline,
                                color: AppColors.appBarIconColors,
                              ),
                      ),
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: '${controller.index}${controller.food.imageUrl}',
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(controller.food.imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                expandedHeight: toolBarHeight,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(12),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Hero(
                        tag: '${controller.index}${controller.food.name}',
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            controller.food.name,
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1800,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        'Amount:',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.decrementAmount,
                          child: const Icon(Ionicons.remove),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: AppColors.buttonTilesColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${controller.amount}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.incrementAmount,
                          child: const Icon(Ionicons.add),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: AppColors.buttonTilesColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    text: AppTranslationKeys.addToCart.tr,
                    color: AppColors.addToCartColor,
                    onPressed: () {
                      controller.addToCart(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
