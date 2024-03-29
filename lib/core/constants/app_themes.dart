import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData themeEnglish = ThemeData(
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.materialPrimary.shade200,
    canvasColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.gray,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.materialPrimary,
      backgroundColor: AppColors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.gray,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
    ),
    indicatorColor: AppColors.materialPrimary.shade600,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    timePickerTheme: const TimePickerThemeData(),
  );
  static ThemeData themeArabic = ThemeData(
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.materialPrimary.shade200,
    canvasColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.gray,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.materialPrimary,
      backgroundColor: AppColors.materialPrimary.shade50,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.gray,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
    ),
    indicatorColor: AppColors.materialPrimary.shade600,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    timePickerTheme: const TimePickerThemeData(),
  );
}
