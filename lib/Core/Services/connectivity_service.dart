import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Global/current_user.dart';

class ConnectivityService extends GetxService {
  late final StreamSubscription<ConnectivityResult> connectivity;
  late Stream<bool> userStatusStream;

  Future<ConnectivityService> init() async {
    return this;
  }

  @override
  void onInit() {
    connectivity = Connectivity().onConnectivityChanged.listen((status) async {
      Get.snackbar('Connectivity', '$status');
      userStatusStream =
          await Stream.periodic(const Duration(seconds: 5)).asyncMap((event) {
        //send status pulse
        if (status != ConnectivityResult.none) {
          if (CurrentUser.currentUser != null) {
            CurrentUser.setStatus(!CurrentUser.isOnline);
            return CurrentUser.isOnline;
          }
        }
        return false;
      }).asBroadcastStream();
    });
    super.onInit();
  }

  @override
  void onClose() {
    connectivity.cancel();
    super.onClose();
  }
}
