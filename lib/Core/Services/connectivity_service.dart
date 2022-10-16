import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Global/current_user.dart';
import 'package:your_chief/Model/Web%20Services/user_api.dart';

import '../../Model/Repository/Repositories/user_repository.dart';

class ConnectivityService extends GetxService {
  late final StreamSubscription<ConnectivityResult> connectivity;
  late Stream<bool> userStatusStream;
  final UserRepository user = UserRepository(UserApi());

  Future<ConnectivityService> init() async {
    return this;
  }

  @override
  void onInit() {
    connectivity = Connectivity().onConnectivityChanged.listen((status) async {
      userStatusStream = await Stream.periodic(const Duration(seconds: 5))
          .asyncMap((event) async {
        //send status pulse
        if (status != ConnectivityResult.none) {
          if (CurrentUser.user != null) {
            //await user.setOnline(CurrentUser.token!);
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
