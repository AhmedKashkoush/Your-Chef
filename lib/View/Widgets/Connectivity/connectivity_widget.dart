import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:your_chief/View/Widgets/Connectivity/connectivity_banner.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget child;
  const ConnectivityWidget({Key? key, required this.child}) : super(key: key);

  //static bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        SafeArea(
          child: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: ((context, snapshot) {
              if (snapshot.data != ConnectivityResult.none)
                return ConnectivityBanner(
                  isOnline: true,
                );
              return ConnectivityBanner(
                isOnline: false,
              );
            }),
          ),
        ),
      ],
    );
  }

  // bool _showBar(AsyncSnapshot snapshot) {
  //   if (snapshot.connectionState == ConnectionState.active) {
  //     bool _isConnected = snapshot.data != ConnectivityResult.none;
  //     //if (_isOnline == _isConnected && _isConnected) return false;
  //     _isOnline = _isConnected;
  //     return true;
  //   }
  //   return true;
  // }
}
