import 'dart:ui';

import 'package:flutter/material.dart';

class AppSizes extends ThemeExtension<AppSizes> {
  static const defaultSizes = AppSizes(20, 25);

  final double padding;
  final double borderRadius;

  const AppSizes(this.padding, this.borderRadius);

  @override
  AppSizes copyWith({
    double? padding,
    double? borderRadius,
  }) {
    return AppSizes(
      padding ?? this.padding,
      borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<AppSizes> lerp(
      covariant ThemeExtension<AppSizes>? other, double t) {
    if (other is! AppSizes) {
      return this;
    }
    return AppSizes(lerpDouble(padding, other.padding, t)!,
        lerpDouble(borderRadius, other.borderRadius, t)!);
  }
}
