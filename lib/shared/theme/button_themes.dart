import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonThemes {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primarySwatch[400],
      foregroundColor: Colors.white,
    ),
  );

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primarySwatch[400],
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primarySwatch[400],
      side: BorderSide(color: AppColors.primarySwatch[400]!),
    ),
  );
}
