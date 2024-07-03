import 'dart:ui';

import 'package:flutter/material.dart';

class AppSizes extends ThemeExtension<AppSizes> {
  static const defaultSizes = AppSizes(20, 16, 25, 10, 5, 15);

  final double padding;
  final double inputPadding;
  final double borderRadius;
  final double pillXPadding;
  final double pillYPadding;
  final double cardGap;

  const AppSizes(this.padding, this.inputPadding, this.borderRadius, this.pillXPadding, this.pillYPadding, this.cardGap);

  @override
  AppSizes copyWith({
    double? padding,
    double? inputPadding,
    double? borderRadius,
    double? pillXPadding,
    double? pillYPadding,
    double? cardGap,
  }) {
    return AppSizes(
      padding ?? this.padding,
      inputPadding ?? this.inputPadding,
      borderRadius ?? this.borderRadius,
      pillXPadding ?? this.pillXPadding,
      pillYPadding ?? this.pillYPadding,
      cardGap ?? this.cardGap,
    );
  }

  @override
  ThemeExtension<AppSizes> lerp(
      covariant ThemeExtension<AppSizes>? other, double t) {
    if (other is! AppSizes) {
      return this;
    }
    return AppSizes(
        lerpDouble(padding, other.padding, t)!,
        lerpDouble(inputPadding, other.inputPadding, t)!,
        lerpDouble(borderRadius, other.borderRadius, t)!,
        lerpDouble(pillXPadding, other.pillXPadding, t)!,
        lerpDouble(pillYPadding, other.pillYPadding, t)!,
        lerpDouble(cardGap, other.cardGap, t)!
    );
  }
}
