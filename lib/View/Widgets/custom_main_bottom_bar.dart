import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomMainBottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;
  const CustomMainBottomBar({Key? key, required this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        showSelectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Ionicons.home),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 8,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.fast_food_outline),
            //activeIcon: Icon(Icons.restaurant_menu),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Ionicons.fast_food),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 8,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.restaurant_outline),
            //activeIcon: Icon(Ionicons.restaurant),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Ionicons.restaurant),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 8,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.heart_outline),
            //activeIcon: Icon(Ionicons.heart),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Ionicons.heart),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 8,
                ),
              ],
            ),
            label: '',
          ),
        ]);
  }
}
