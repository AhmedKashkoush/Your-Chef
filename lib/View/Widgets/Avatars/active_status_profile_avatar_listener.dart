import 'package:flutter/material.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/View/Widgets/Avatars/custom_profile_avatar.dart';

class ActiveStatusProfileAvatarListener extends StatelessWidget {
  final Stream<bool> onlineStream;
  final String name;
  final Color color;
  final VoidCallback? onTap;
  final ImageProvider<Object>? image;
  const ActiveStatusProfileAvatarListener({
    Key? key,
    required this.onlineStream,
    required this.name,
    required this.color,
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: onlineStream,
        initialData: CurrentUser.isOnline,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return CustomProfileAvatar(
            name: name,
            color: color,
            isOnline: snapshot.data!,
            onTap: onTap,
            image: image,
          );
        });
  }
}
