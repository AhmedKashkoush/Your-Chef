import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class CustomMainBottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;
  const CustomMainBottomBar({Key? key, required this.selectedIndex, this.onTap})
      : super(key: key);

  static final List<IconData> _icons = [
    Ionicons.home_outline,
    Ionicons.fast_food_outline,
    Ionicons.restaurant_outline,
    Ionicons.heart_outline,
  ];

  static final List<IconData> _iconsActive = [
    Ionicons.home,
    Ionicons.fast_food,
    Ionicons.restaurant,
    Ionicons.heart,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).scaffoldBackgroundColor,
      notchMargin: 14,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < _icons.length + 1; i++)
            i == _icons.length / 2
                ? Spacer()
                : Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {
                          onTap?.call(i > _icons.length / 2 ? i - 1 : i);
                        },
                        icon: AnimatedScale(
                          scale: (i < _iconsActive.length / 2 &&
                                      selectedIndex == i) ||
                                  (i > _iconsActive.length / 2 &&
                                      selectedIndex == i - 1)
                              ? 1.4
                              : 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              (i < _iconsActive.length / 2 &&
                                          selectedIndex == i) ||
                                      (i > _iconsActive.length / 2 &&
                                          selectedIndex == i - 1)
                                  ? Icon(
                                      i > _iconsActive.length / 2
                                          ? _iconsActive[i - 1]
                                          : _iconsActive[i],
                                      color: AppColors.primary,
                                    )
                                  : Icon(
                                      i > _icons.length / 2
                                          ? _icons[i - 1]
                                          : _icons[i],
                                    ),
                              if ((i < _iconsActive.length / 2 &&
                                      selectedIndex == i) ||
                                  (i > _iconsActive.length / 2 &&
                                      selectedIndex == i - 1))
                                Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: AppColors.primary,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
        ],
      ),
    );
    //   return BottomNavigationBar(
    //       currentIndex: selectedIndex,
    //       onTap: onTap,
    //       showSelectedLabels: true,
    //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //       selectedItemColor: Theme.of(context).primaryColor,
    //       unselectedItemColor: Theme.of(context).iconTheme.color,
    //       type: BottomNavigationBarType.shifting,
    //       items: [
    //         BottomNavigationBarItem(
    //           icon: Icon(Ionicons.home_outline),
    //           activeIcon: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Icon(Ionicons.home),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Icon(
    //                 Icons.circle,
    //                 size: 8,
    //               ),
    //             ],
    //           ),
    //           label: '',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Ionicons.fast_food_outline),
    //           //activeIcon: Icon(Icons.restaurant_menu),
    //           activeIcon: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Icon(Ionicons.fast_food),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Icon(
    //                 Icons.circle,
    //                 size: 8,
    //               ),
    //             ],
    //           ),
    //           label: '',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Ionicons.restaurant_outline),
    //           //activeIcon: Icon(Ionicons.restaurant),
    //           activeIcon: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Icon(Ionicons.restaurant),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Icon(
    //                 Icons.circle,
    //                 size: 8,
    //               ),
    //             ],
    //           ),
    //           label: '',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Ionicons.heart_outline),
    //           //activeIcon: Icon(Ionicons.heart),
    //           activeIcon: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Icon(Ionicons.heart),
    //               const SizedBox(
    //                 height: 5,
    //               ),
    //               Icon(
    //                 Icons.circle,
    //                 size: 8,
    //               ),
    //             ],
    //           ),
    //           label: '',
    //         ),
    //       ]);
  }
}
