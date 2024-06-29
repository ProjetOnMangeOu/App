import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/button_themes.dart';
import 'package:onmangeou/shared/theme/colors.dart';
import 'package:onmangeou/shared/theme/typography.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: AppTypography.textTheme,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: const Color(0xFFFFFBF4),
    elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme,
    textButtonTheme: AppButtonThemes.textButtonTheme,
    outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme,
  );
}
