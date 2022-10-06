import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SocialAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final SocialAuthButtonType type;
  const SocialAuthButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.onLongPress,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        primary: _checkTypeForColor(type, context),
        side: BorderSide(
          color: _checkTypeForColor(type, context),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      icon: Icon(
        _checkTypeForIcon(type),
        color: _checkTypeForColor(type, context),
      ),
      label: Text(
        text,
        style: TextStyle(
          color: _checkTypeForColor(type, context),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  IconData _checkTypeForIcon(SocialAuthButtonType type) {
    switch (type) {
      case SocialAuthButtonType.facebook:
        return Ionicons.logo_facebook;
      case SocialAuthButtonType.google:
        return Ionicons.logo_google;
      case SocialAuthButtonType.microsoft:
        return Ionicons.logo_microsoft;
      case SocialAuthButtonType.apple:
        return Ionicons.logo_apple;
      case SocialAuthButtonType.yahoo:
        return Ionicons.logo_yahoo;
      case SocialAuthButtonType.twitter:
        return Ionicons.logo_twitter;
    }
  }

  Color _checkTypeForColor(SocialAuthButtonType type, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    switch (type) {
      case SocialAuthButtonType.facebook:
        return Colors.blueAccent;
      case SocialAuthButtonType.google:
        return Colors.redAccent;
      case SocialAuthButtonType.microsoft:
        return Colors.blue.shade800;
      case SocialAuthButtonType.apple:
        return isDark ? Colors.white : Colors.black;
      case SocialAuthButtonType.yahoo:
        return Colors.purple;
      case SocialAuthButtonType.twitter:
        return Colors.blue.shade400;
    }
  }
}

enum SocialAuthButtonType { facebook, google, microsoft, apple, yahoo, twitter }
