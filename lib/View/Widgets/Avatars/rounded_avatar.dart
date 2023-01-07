import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedAvatar extends StatelessWidget {
  final double radius;
  final double? size;
  final double? width;
  final double? height;
  final String? imageUrl;
  final bool isAsset;
  final Color? color;
  const RoundedAvatar({
    Key? key,
    this.radius = 15,
    this.imageUrl,
    this.size,
    this.isAsset = false,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      clipBehavior: Clip.antiAlias,
      duration: const Duration(milliseconds: 700),
      width: width != null ? width : size,
      height: height != null ? height : size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        image: imageUrl != null
            ? (!isAsset
                ? DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl!),
                    isAntiAlias: true,
                    fit: BoxFit.fill,
                  )
                : DecorationImage(
                    image: AssetImage(imageUrl!),
                    isAntiAlias: true,
                    fit: BoxFit.fill,
                  ))
            : null,
      ),
    );
  }
}
