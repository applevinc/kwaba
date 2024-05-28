import 'package:flutter/material.dart';

abstract class AppPadding {
  static double horizontal = 16;

  static double vertical = 20;

  static EdgeInsetsGeometry get defaultPadding {
    return EdgeInsets.only(
      top: vertical,
      left: horizontal,
      right: horizontal,
      bottom: 40,
    );
  }

  static EdgeInsetsGeometry get symetricHorizontalOnly {
    return EdgeInsets.symmetric(horizontal: horizontal);
  }

  static EdgeInsetsGeometry get symetricVerticalOnly {
    return EdgeInsets.symmetric(vertical: vertical);
  }
}

double screenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}
