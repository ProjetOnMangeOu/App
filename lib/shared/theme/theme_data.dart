import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/button_themes.dart';
import 'package:onmangeou/shared/theme/colors.dart';
import 'package:onmangeou/shared/theme/typography.dart';

class ThemeClass {
  static final ColorScheme colorScheme = ColorScheme(
    primary: const Color(AppColors.primaryColor),
    primaryContainer: AppColors.primarySwatch[400]!,
    secondary: const Color(AppColors.secondaryColor),
    secondaryContainer: AppColors.secondarySwatch[400]!,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: AppTypography.textTheme,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: const Color(0xFFFFFBF4),
    elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme,
    textButtonTheme: AppButtonThemes.textButtonTheme,
    outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme,
  );
}
