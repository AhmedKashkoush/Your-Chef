import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Home/Cart/cart_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/AppBars/transparent_app_bar.dart';
import 'package:your_chief/View/Widgets/Loading/card_list_tile_loading.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'cart',
      child: GetBuilder<CartController>(builder: (controller) {
        return Scaffold(
          appBar: TransparentAppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Ionicons.cart_outline,
                  color: AppColors.primary,
                  size: 28,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  AppTranslationKeys.cart.tr,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          body: controller.isLoading
              ? ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return CardListTileLoading(
                      initialDelay: 200 * index,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: 8,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Ionicons.cart_outline,
                      color: AppColors.appBarIconColors.withOpacity(0.5),
                      size: 100,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Nothing in the cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.appBarIconColors.withOpacity(0.5),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
