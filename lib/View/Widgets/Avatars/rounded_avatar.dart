import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class RoundedAvatar extends StatelessWidget {
  final double radius;
  final double? size;
  final String imageUrl;
  const RoundedAvatar({
    Key? key,
    this.radius = 15,
    required this.imageUrl,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          isAntiAlias: true,
        ),
      ),
    );
  }
}
