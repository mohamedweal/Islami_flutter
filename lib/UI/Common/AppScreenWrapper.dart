import 'package:flutter/material.dart';

import '../design.dart';

class AppScreenWrapper extends StatelessWidget {
  Widget child;
  String backGroundImagePath;

  AppScreenWrapper({
    required this.child,
    this.backGroundImagePath = AppImages.Defult_backgroundImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(backGroundImagePath)),
      ),
      child: child,
    );
  }
}
