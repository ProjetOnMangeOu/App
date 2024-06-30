import 'dart:ui';

import 'package:flutter/material.dart';

class AppSizes extends ThemeExtension<AppSizes> {
  static const defaultSizes = AppSizes(20);

  final double padding;

  const AppSizes(this.padding);

  @override
  AppSizes copyWith({
    double? padding,
  }) {
    return AppSizes(padding ?? this.padding);
  }

  @override
  ThemeExtension<AppSizes> lerp(covariant ThemeExtension<AppSizes>? other, double t) {
    if (other is! AppSizes) {
      return this;
    }
    return AppSizes(lerpDouble(padding, other.padding, t)!);
  }
}