import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Core/Routing/route_names.dart';
import 'package:your_chief/Model/Models/user_model.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
  int _currentPage = 0;
  int get currentPage => _currentPage;
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  @override
  void onInit() {
    _currentUser = CurrentUser.user;
    super.onInit();
  }

  final List<Widget> pages = const [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  void openDrawer() {
    homeKey.currentState?.openDrawer();
  }

  void changePage(int index) {
    _currentPage = index;
    update();
  }

  void onSearchTap() {
    Get.toNamed(AppRouteNames.homeSearch);
  }
}
