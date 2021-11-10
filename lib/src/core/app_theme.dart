import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.grey2,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: AppColors.grey2,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey2,
      titleTextStyle: AppTextStyles.appBarTextStyle,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.grey2,
      splashColor: AppColors.orange2,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey2,
      selectedItemColor: AppColors.orange2,
      unselectedItemColor: AppColors.grey3,
    ),
  );
}
