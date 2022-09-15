import 'package:flutter/cupertino.dart';

class OrientationWidget extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;
  const OrientationWidget(
      {Key? key, required this.portrait, required this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return landscape;
      }
      return portrait;
    }));
  }
}
