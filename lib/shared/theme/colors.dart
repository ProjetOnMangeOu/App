import 'package:flutter/material.dart';

class AppColors {
  static const int backgroundColor = 0xFFFFFBF4;

  static const int primaryColor = 0xFFFFB84C;
  static const primarySwatch = MaterialColor(primaryColor, <int, Color>{
    50: Color(0xFFFFFAED),
    100: Color(0xFFFFF4D4),
    200: Color(0xFFFFE4A8),
    300: Color(0xFFFFD071),
    400: Color(primaryColor),
    500: Color(0xFFFE9611),
    600: Color(0xFFEF7B07),
    700: Color(0xFFC65C08),
    800: Color(0xFF9D490F),
    900: Color(0xFF9D490F),
    950: Color(0xFF441C06),
  });

  static const int secondaryColor = 0xFFFF4D58;
  static const secondarySwatch = MaterialColor(secondaryColor, <int, Color>{
    50: Color(0xFFFFF1F2),
    100: Color(0xFFFFDFE1),
    200: Color(0xFFFFC5C9),
    300: Color(0xFFFF9DA3),
    400: Color(0xFFFF646E),
    500: Color(secondaryColor),
    600: Color(0xFFED1522),
    700: Color(0xFFC80D19),
    800: Color(0xFFA50F18),
    900: Color(0xFF88141B),
    950: Color(0xFF4B0408),
  });

  static const int accentColor = 0xFF38AEFE;
  static const accentSwatch = MaterialColor(accentColor, <int, Color>{
    50: Color(0xFFF0F8FF),
    100: Color(0xFFDFEFFF),
    200: Color(0xFFB8E0FF),
    300: Color(0xFF79C7FF),
    400: Color(accentColor),
    500: Color(0xFF0791F0),
    600: Color(0xFF0072CD),
    700: Color(0xFF005AA6),
    800: Color(0xFF034D89),
    900: Color(0xFF094171),
    950: Color(0xFF06284B),
  });

  static const int neutral = 0xFF262626;
  static const neutralSwatch = MaterialColor(neutral, <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFE5E5E5),
    300: Color(0xFFD4D4D4),
    400: Color(0xFFA3A3A3),
    500: Color(0xFF737373),
    600: Color(0xFF525252),
    700: Color(0xFF404040),
    800: Color(neutral),
    900: Color(0xFF171717),
    950: Color(0xFF0A0A0A),
  });
}
