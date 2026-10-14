import 'package:donuts_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: AppColors.pageBackground,
      onSurface: Colors.black,
      primary: AppColors.softPink,
      onPrimary: Colors.white,
    ),
  );
}
