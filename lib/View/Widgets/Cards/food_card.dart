import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/api_headers.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/Model/Models/food_model.dart';
import 'package:your_chief/View/Widgets/Avatars/rounded_avatar.dart';
import 'package:your_chief/View/Widgets/Buttons/heart_button.dart';

class FoodCard extends StatefulWidget {
  final FoodModel model;
  final void Function()? onTap;
  final void Function()? onFavouriteTap;
  final bool isListTile;
  final int? index;
  const FoodCard({
    Key? key,
    required this.model,
    this.onFavouriteTap,
    this.isListTile = true,
    required this.onTap,
    this.index,
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
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        // color: AppColors.appBarIconColors.withOpacity(0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 120,
          child: widget.isListTile
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: '${widget.index}${widget.model.imageUrl}',
                        child: Container(
                          //height: context.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                widget.model.imageUrl,
                                headers: ApiHeaders.authHeaders,
                                cacheKey: widget.model.imageUrl,
                              ),
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 14),
                              child: Row(
                                children: [
                                  Hero(
                                    tag: '${widget.index}${widget.model.name}',
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        widget.model.name,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  Hero(
                                    tag: '${widget.index}favourite',
                                    child: HeartButton(
                                      onTap: widget.onFavouriteTap,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                horizontalTitleGap: -2,
                                leading: Hero(
                                  tag: '${widget.index}restaurant',
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: RoundedAvatar(
                                      imageUrl: widget.model.restaurant.image,
                                      radius: 10,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  '${AppTranslationKeys.from.tr}: ${widget.model.restaurant.name}',
                                  style: const TextStyle(
                                    color: AppColors.appBarIconColors,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Hero(
                                  tag: '${widget.index}rating',
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: RatingBar(
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
                                ),
                                trailing: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Hero(
                                      tag: '${widget.index}price',
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Text(
                                          '${widget.model.price}\$',
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            color: AppColors.secondary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (widget.model.hasOffer)
                                      Positioned.directional(
                                        textDirection:
                                            Directionality.of(context),
                                        top: -15,
                                        end: -5,
                                        child: Hero(
                                          tag: '${widget.index}oldprice',
                                          child: Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                              '${widget.model.oldPrice}\$',
                                              style: const TextStyle(
                                                color:
                                                    AppColors.appBarIconColors,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Hero(
                            tag: '${widget.index}${widget.model.imageUrl}',
                            child: Container(
                              //height: context.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    widget.model.imageUrl,
                                    headers: ApiHeaders.authHeaders,
                                    cacheKey: widget.model.imageUrl,
                                  ),
                                  isAntiAlias: true,
                                ),
                              ),
                            ),
                          ),
                          Hero(
                            tag: '${widget.index}favourite',
                            child: HeartButton(
                              onTap: widget.onFavouriteTap,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Hero(
                                tag: '${widget.index}${widget.model.name}',
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    widget.model.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                horizontalTitleGap: -2,
                                leading: Hero(
                                  tag: '${widget.index}restaurant',
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: RoundedAvatar(
                                      imageUrl: widget.model.restaurant.image,
                                      radius: 10,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  '${AppTranslationKeys.from.tr}: ${widget.model.restaurant.name}',
                                  style: const TextStyle(
                                    color: AppColors.appBarIconColors,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                  ),
                                ),
                                subtitle: Hero(
                                  tag: '${widget.index}rating',
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: RatingBar(
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 14,
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                clipBehavior: Clip.none,
                                children: [
                                  Hero(
                                    tag: '${widget.index}price',
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        '${widget.model.price}\$',
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          color: AppColors.secondary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (widget.model.hasOffer)
                                    Positioned.directional(
                                      textDirection: Directionality.of(context),
                                      top: -15,
                                      end: -5,
                                      child: Hero(
                                        tag: '${widget.index}oldprice',
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            '${widget.model.oldPrice}\$',
                                            style: const TextStyle(
                                              color: AppColors.appBarIconColors,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
