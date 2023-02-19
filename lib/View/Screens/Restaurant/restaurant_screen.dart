import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Controllers/Restaurant/restaurant_screen_controller.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Widgets/AppBars/transparent_app_bar.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantScreenController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TransparentAppBar(),
        body: ListView(
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        image: CachedNetworkImageProvider(
                          controller.restaurant.image,
                        ),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: 18,
                    bottom: -100,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: CachedNetworkImageProvider(
                              controller.restaurant.image,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.restaurant.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 18,
                                ),
                              ],
                            ),
                            RatingBar(
                              itemSize: 18,
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
                              initialRating: controller.restaurant.rate,
                              glow: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            ListTile(
              title: Text(
                AppTranslationKeys.aboutUs.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              subtitle: Text(
                controller.restaurant.description,
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              height: 0,
            ),
            ListTile(
              title: Text(
                AppTranslationKeys.contact.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              subtitle: Text(
                controller.restaurant.phone,
              ),
              trailing: IconButton(
                onPressed: controller.callRestaurant,
                icon: Icon(Icons.call_outlined),
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              height: 0,
            ),
            ListTile(
              title: Text(
                AppTranslationKeys.location.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              subtitle: Text(
                controller.restaurant.description,
              ),
            ),
            const Divider(
              indent: 12,
              endIndent: 12,
              thickness: 1,
              height: 0,
            ),
            ListTile(
              title: Text(
                '${AppTranslationKeys.moreFrom.tr} ${controller.restaurant.name}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              subtitle: SizedBox(
                height: 140,
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return VerticalDivider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      color: Colors.white,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            // SizedBox(
            //   height: 500,
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     fit: StackFit.expand,
            //     children: [
            //       Positioned.directional(
            //         top: 0,
            //         textDirection: Directionality.of(context),
            //         child: Placeholder(
            //           fallbackHeight: 250,
            //         ),
            //       ),
            //       Positioned.directional(
            //         textDirection: Directionality.of(context),
            //         // start: 0,
            //         // bottom: 0,
            //         child: Padding(
            //           padding: const EdgeInsets.all(12.0),
            //           child: Row(
            //             children: [
            //               CircleAvatar(
            //                 radius: 60,
            //                 backgroundImage: CachedNetworkImageProvider(
            //                     controller.restaurant.image),
            //               ),
            //               Expanded(
            //                   child: ListTile(
            //                 title: Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     Text(
            //                       controller.restaurant.name,
            //                       style: const TextStyle(
            //                         fontSize: 24,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Icon(
            //                       Icons.check_circle,
            //                       color: Colors.blue,
            //                       size: 18,
            //                     )
            //                   ],
            //                 ),
            //               )),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
