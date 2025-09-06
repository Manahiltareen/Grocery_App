import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_theme.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/responsive-text-size.dart';


class CustomBlueButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor; // <--- MAKE SURE THIS IS PRESENT
  final Color? textColor;      // <--- MAKE SURE THIS IS PRESENT

  const CustomBlueButton({
    super.key, // Changed to super.key for modern Dart
    this.text,
    this.onPressed,
    this.padding,
    this.backgroundColor, // <--- MAKE SURE THIS IS INITIALIZED IN CONSTRUCTOR
    this.textColor, SizedBox? child,      // <--- MAKE SURE THIS IS INITIALIZED IN CONSTRUCTOR
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.blueColor, // Use provided color or default
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
      ),
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: FontSizeUtil.medium(context),
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}