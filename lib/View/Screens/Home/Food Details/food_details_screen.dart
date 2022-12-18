import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                        color: Colors.white,
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
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppTranslationKeys.price.tr}:',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Hero(
                              tag: '${controller.index}price',
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  '${controller.food.price}\$',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        indent: 20,
                        endIndent: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppTranslationKeys.rate.tr}:',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Hero(
                              tag: '${controller.index}rating',
                              child: Material(
                                type: MaterialType.transparency,
                                child: RatingBar(
                                  itemSize: 20,
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Ionicons.star,
                                      color: AppColors.primary,
                                    ),
                                    half: Icon(
                                      Ionicons.star_half_outline,
                                      color: AppColors.primary,
                                    ),
                                    empty: Icon(
                                      Ionicons.star_outline,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  allowHalfRating: true,
                                  onRatingUpdate: (double value) {},
                                  ignoreGestures: true,
                                  initialRating: controller.food.rate,
                                  glow: false,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '${controller.food.rate}/5',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        indent: 20,
                        endIndent: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppTranslationKeys.stock.tr}:',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${controller.food.stock - controller.amount}',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        indent: 20,
                        endIndent: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppTranslationKeys.totalPrice.tr}:',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${controller.totalPrice}\$',
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        indent: 20,
                        endIndent: 40,
                      ),
                      Text(
                        AppTranslationKeys.description.tr,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${controller.food.description}',
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        indent: 20,
                        endIndent: 40,
                      ),
                      Text(
                        AppTranslationKeys.from.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hero(
                            tag: '${controller.index}restaurant',
                            child: Material(
                              type: MaterialType.transparency,
                              child: RoundedAvatar(
                                imageUrl: controller.food.restaurantImageUrl,
                                radius: 10,
                                size: 80,
                                isAsset: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.food.restaurant,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              children: [
                Text(
                  '${AppTranslationKeys.amount.tr}:',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.decrementAmount,
                  child: const Icon(Ionicons.remove),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: AppColors.buttonTilesColor,
                  ),
                ),
                FittedBox(
                  child: Text(
                    '${controller.amount}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.incrementAmount,
                  child: const Icon(Ionicons.add),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: AppColors.buttonTilesColor,
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    text: AppTranslationKeys.addToCart.tr,
                    icon: Ionicons.cart,
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
