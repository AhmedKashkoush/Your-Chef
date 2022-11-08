import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:your_chief/Controllers/Home/food_view_controller.dart';
import 'package:your_chief/View/Widgets/Cards/food_card.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodViewController>(builder: (controller) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: controller.foods.length,
        itemBuilder: (context, index) {
          return FoodCard(
            model: controller.foods[index],
            onTap: controller.preview,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
      );
    });
  }
}
