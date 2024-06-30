import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/theme/button_themes.dart';
import 'package:onmangeou/shared/theme/colors.dart';
import 'package:onmangeou/shared/theme/typography.dart';

class ThemeClass {
  static final ColorScheme colorScheme = ColorScheme(
    primary: const Color(AppColors.primaryColor),
    primaryContainer: AppColors.primarySwatch[400]!,
    secondary: const Color(AppColors.secondaryColor),
    secondaryContainer: AppColors.secondarySwatch[400]!,
    surface: const Color(AppColors.backgroundColor),
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: const Color(AppColors.neutral),
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: AppTypography.textTheme,
    primarySwatch: AppColors.primarySwatch,
    scaffoldBackgroundColor: const Color(AppColors.backgroundColor),
    elevatedButtonTheme: AppButtonThemes.elevatedButtonTheme,
    textButtonTheme: AppButtonThemes.textButtonTheme,
    outlinedButtonTheme: AppButtonThemes.outlinedButtonTheme,
    extensions: const [AppSizes.defaultSizes, AppShadows.defaultShadows],
  );
}
