import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Model/Models/food_model.dart';

class FoodCard extends StatefulWidget {
  final FoodModel model;
  final void Function()? onTap;
  final void Function()? onFavouriteTap;
  final bool isListTile;
  const FoodCard({
    Key? key,
    required this.model,
    this.onFavouriteTap,
    this.isListTile = true,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  late bool isFavourite;
  @override
  void initState() {
    isFavourite = widget.model.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      message: widget.model.hasOffer && widget.model.sale != null
          ? '${widget.model.sale! * 100.0}%'
          : '',
      color: widget.model.hasOffer ? AppColors.badgeColor : Colors.transparent,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            //height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(widget.model.imageUrl),
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          horizontalTitleGap: -5,
                          title: Text(
                            widget.model.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing:
                              StatefulBuilder(builder: (context, setState) {
                            return IconButton(
                              onPressed: widget.onFavouriteTap == null
                                  ? null
                                  : () {
                                      widget.onFavouriteTap?.call();
                                      setState(() {
                                        isFavourite = !isFavourite;
                                      });
                                    },
                              icon: isFavourite
                                  ? Icon(Ionicons.heart,
                                      color: AppColors.badgeColor)
                                  : Icon(Ionicons.heart_outline),
                            );
                          }),
                        ),
                        ListTile(
                          //leading: RoundedAvatar(imageUrl: model.restaurantImageUrl,),
                          leading: Image.asset(
                            widget.model.restaurantImageUrl,
                            height: 40,
                          ),
                          title: Text(
                            'From: ${widget.model.restaurant}',
                            style: const TextStyle(
                              color: AppColors.appBarIconColors,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: RatingBar(
                            itemSize: 15,
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
                            initialRating: widget.model.rate,
                            glow: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            clipBehavior: Clip.none,
                            children: [
                              Text(
                                '${widget.model.price}\$',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                top: -15,
                                end: -5,
                                child: Text(
                                  '${widget.model.oldPrice}\$',
                                  style: const TextStyle(
                                    color: AppColors.appBarIconColors,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // ListTile(
                        //   title: Text(
                        //     '${widget.model.price}\$',
                        //     style: const TextStyle(
                        //       color: AppColors.secondary,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 14,
                        //     ),
                        //   ),
                        //   subtitle: widget.model.hasOffer
                        //       ? Text(
                        //           '${widget.model.oldPrice}\$',
                        //           style: const TextStyle(
                        //             color: AppColors.appBarIconColors,
                        //             decoration: TextDecoration.lineThrough,
                        //           ),
                        //         )
                        //       : null,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
