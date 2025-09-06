// utils/screen_type_util.dart
import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }// costum data type

class ScreenTypeUtil {
  static ScreenType getScreenType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return ScreenType.mobile;
    } else if (width >= 600 && width < 1024) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
