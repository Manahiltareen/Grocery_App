import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/responsive-text-size.dart';



class AppTheme {
  static const Color primaryColor = Color(0xFF2962FF);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color lightTextColor = Colors.black54;
  static const Color cardColor = Colors.white;
  static const Color blueColor = Color(0xFF3F3798);
  static const Color highlightRed = Colors.redAccent;
  static const Color greyColor = Colors.grey;



  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 32, tablet: 38, desktop: 44), fontWeight: FontWeight.bold, color: textColor),
        displayMedium: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 28, tablet: 34, desktop: 40), fontWeight: FontWeight.bold, color: textColor),
        displaySmall: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 24, tablet: 30, desktop: 36), fontWeight: FontWeight.bold, color: textColor),
        headlineMedium: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 20, tablet: 26, desktop: 32), fontWeight: FontWeight.bold, color: textColor),
        headlineSmall: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 18, tablet: 24, desktop: 30), fontWeight: FontWeight.bold, color: textColor),
        titleLarge: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 16, tablet: 20, desktop: 24), fontWeight: FontWeight.bold, color: textColor),
        bodyLarge: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 16, tablet: 18, desktop: 22), color: textColor),
        bodyMedium: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 14, tablet: 16, desktop: 20), color: lightTextColor),
        labelLarge: TextStyle(fontSize: FontSizeUtil.getFontSize(context, mobile: 14, tablet: 16, desktop: 20), fontWeight: FontWeight.bold, color: Colors.white),
      ),

      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }
}