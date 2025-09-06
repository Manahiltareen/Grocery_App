// utils/font_size_util.dart
import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/screen-type.dart';


class FontSizeUtil {
  static double getFontSize(BuildContext context,
      {required double mobile,
      required double tablet,
      required double desktop}) {
    ScreenType type = ScreenTypeUtil.getScreenType(context);

    switch (type) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
        return desktop;
    }
  }

  // Enhanced font size helpers with smoother scaling
  static double tiny(BuildContext context) {
    return getFontSize(context, mobile: 10, tablet: 11, desktop: 12);
  }

  static double small(BuildContext context) {
    return getFontSize(context, mobile: 12, tablet: 14, desktop: 16);
  }

  static double medium(BuildContext context) {
    return getFontSize(context, mobile: 14, tablet: 16, desktop: 18);
  }

  static double regular(BuildContext context) {
    return getFontSize(context, mobile: 16, tablet: 18, desktop: 20);
  }

  static double large(BuildContext context) {
    return getFontSize(context, mobile: 18, tablet: 20, desktop: 22);
  }

  static double xlarge(BuildContext context) {
    return getFontSize(context, mobile: 20, tablet: 22, desktop: 24);
  }

  static double xxlarge(BuildContext context) {
    return getFontSize(context, mobile: 22, tablet: 24, desktop: 26);
  }

  static double title(BuildContext context) {
    return getFontSize(context, mobile: 24, tablet: 26, desktop: 28);
  }

  static double heading(BuildContext context) {
    return getFontSize(context, mobile: 26, tablet: 28, desktop: 30);
  }
}

// Enhanced Font Management Class
class AppFonts {
  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Text styles with consistent sizing
  static TextStyle getTitle(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.title(context),
      fontWeight: weight ?? bold,
      color: color,
      letterSpacing: 0.5,
    );
  }

  static TextStyle getHeading(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.heading(context),
      fontWeight: weight ?? bold,
      color: color,
      letterSpacing: 0.3,
    );
  }

  static TextStyle getLarge(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.large(context),
      fontWeight: weight ?? semiBold,
      color: color,
      letterSpacing: 0.2,
    );
  }

  static TextStyle getRegular(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.regular(context),
      fontWeight: weight ?? medium,
      color: color,
      letterSpacing: 0.1,
    );
  }

  static TextStyle getMedium(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.medium(context),
      fontWeight: weight ?? regular,
      color: color,
      letterSpacing: 0.1,
    );
  }

  static TextStyle getSmall(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.small(context),
      fontWeight: weight ?? regular,
      color: color,
      letterSpacing: 0.1,
    );
  }

  static TextStyle getTiny(BuildContext context,
      {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: FontSizeUtil.tiny(context),
      fontWeight: weight ?? regular,
      color: color,
      letterSpacing: 0.1,
    );
  }
}
