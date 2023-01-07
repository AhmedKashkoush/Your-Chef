import 'package:flutter/material.dart';

class TransparentAppBar extends AppBar {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSize? bottom;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool centerTitle;

  TransparentAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.foregroundColor,
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
  }) : super(
          key: key,
          title: title,
          leading: leading,
          actions: actions,
          bottom: bottom,
          foregroundColor: foregroundColor,
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: centerTitle,
        );
}
