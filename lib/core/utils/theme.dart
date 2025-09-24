import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';


class apptheme {
  static get lighttheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whitecolor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whitecolor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primarycolor,
      onSurface: AppColors.darkcolor,
    ),
    fontFamily: AppFonts.DMSeriffont,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.graycolor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.blackcolor),
      ),
    ),
  );
}
