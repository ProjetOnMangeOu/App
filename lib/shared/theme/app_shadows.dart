import 'package:flutter/material.dart';

class AppShadows extends ThemeExtension<AppShadows> {
  static const defaultShadows = AppShadows(
    BoxShadow(
      color: Color.fromRGBO(10, 10, 10, 0.25),
      spreadRadius: 5,
      blurRadius: 20,
      offset: Offset(0, 4),
    ),
  );

  final BoxShadow shadow;

  const AppShadows(this.shadow);

  @override
  AppShadows copyWith({
    BoxShadow? formShadow,
  }) {
    return AppShadows(
      formShadow ?? shadow,
    );
  }

  @override
  ThemeExtension<AppShadows> lerp(
      covariant ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) {
      return this;
    }
    return AppShadows(other.shadow);
  }
}
