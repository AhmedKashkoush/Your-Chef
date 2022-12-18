import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final String text;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Color? color;
  final IconData? icon;
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.style,
    this.textStyle,
    this.onLongPress,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: style ??
          ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            primary: color != null ? color : Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
      child: icon == null
          ? Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            )
          : FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      text,
                      style: textStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
