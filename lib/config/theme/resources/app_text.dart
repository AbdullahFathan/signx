import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';

class TextClass {
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
      fontSize: 12,
    ),
  );
}
