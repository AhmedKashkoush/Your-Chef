import 'package:flutter/material.dart';
import 'package:your_chief/View/Widgets/Drawers/main_drawer.dart';

class MainDrawerItem {
  final String name;
  final IconData icon;
  final IconData activeIcon;
  final MainDrawerPage type;

  const MainDrawerItem({
    required this.name,
    required this.icon,
    required this.activeIcon,
    required this.type,
  });
}
