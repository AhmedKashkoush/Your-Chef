import 'package:flutter/material.dart';

class OutlinedPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  const OutlinedPrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.style,
    this.textStyle,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: style ??
          OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            primary: Theme.of(context).primaryColor,
            side: BorderSide(color: Theme.of(context).primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
