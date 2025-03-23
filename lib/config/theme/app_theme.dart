import 'package:flutter/material.dart';
import 'package:signx/config/theme/resources/app_color.dart';
import 'package:signx/config/theme/resources/app_input_style.dart';
import 'package:signx/config/theme/resources/app_text.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    textTheme: TextClass.textTheme,
    scaffoldBackgroundColor: AppColors.scafflodBgColor,
    inputDecorationTheme: InputDecorationStyle.inputDecoration(),
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: AppColors.scafflodBgColor,
      elevation: 1,
    ),
  );
}
