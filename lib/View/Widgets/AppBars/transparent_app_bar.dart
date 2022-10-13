import 'package:flutter/material.dart';

class TransparentAppBar extends AppBar {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSize? bottom;
  final Color? foregroundColor;

  TransparentAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.foregroundColor,
  }) : super(
          key: key,
          title: title,
          leading: leading,
          actions: actions,
          bottom: bottom,
          foregroundColor: foregroundColor,
          elevation: 0,
          backgroundColor: Colors.transparent,
        );
}
