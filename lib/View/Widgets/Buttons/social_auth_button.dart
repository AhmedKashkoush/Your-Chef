import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Utils/Options/social_auth_options.dart';

class SocialAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final SocialAuthOption type;
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

  IconData _checkTypeForIcon(SocialAuthOption type) {
    switch (type) {
      case SocialAuthOption.facebook:
        return Ionicons.logo_facebook;
      case SocialAuthOption.google:
        return Ionicons.logo_google;
      case SocialAuthOption.microsoft:
        return Ionicons.logo_microsoft;
      case SocialAuthOption.apple:
        return Ionicons.logo_apple;
      case SocialAuthOption.yahoo:
        return Ionicons.logo_yahoo;
      case SocialAuthOption.twitter:
        return Ionicons.logo_twitter;
    }
  }

  Color _checkTypeForColor(SocialAuthOption type, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    switch (type) {
      case SocialAuthOption.facebook:
        return Colors.blueAccent;
      case SocialAuthOption.google:
        return Colors.redAccent;
      case SocialAuthOption.microsoft:
        return Colors.blue.shade800;
      case SocialAuthOption.apple:
        return isDark ? Colors.white : Colors.black;
      case SocialAuthOption.yahoo:
        return Colors.purple;
      case SocialAuthOption.twitter:
        return Colors.blue.shade400;
    }
  }
}
