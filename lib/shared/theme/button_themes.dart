import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonThemes {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primarySwatch[400],
      elevation: 0,
      foregroundColor: const Color(AppColors.neutral),
      shadowColor: Colors.transparent,
      overlayColor: Colors.white,
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primarySwatch[400],
      padding: EdgeInsets.zero,
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primarySwatch[400],
      side: BorderSide(color: AppColors.primarySwatch[400]!),
    ),
  );
}
