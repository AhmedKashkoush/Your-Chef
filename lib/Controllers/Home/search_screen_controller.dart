import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  bool _showClear = false;
  bool get showClear => _showClear;

  @override
  void onInit() {
    searchController.addListener(_onChange);
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onChange() {
    if (searchController.text.isEmpty) {
      if (_showClear) {
        _showClear = false;
        update();
      }
    } else {
      if (!_showClear) {
        _showClear = true;
        update();
      }
    }
  }

  void clear() {
    searchController.clear();
    update();
  }

  void search(String? query) {}
  void toVoiceSearch() {}
}
