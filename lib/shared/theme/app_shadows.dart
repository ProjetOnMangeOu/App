import 'package:flutter/material.dart';

class AppShadows extends ThemeExtension<AppShadows> {
  static const defaultShadows = AppShadows(
      BoxShadow(
        color: Color.fromRGBO(10, 10, 10, 0.25),
        spreadRadius: 5,
        blurRadius: 20,
        offset: Offset(0, 4),
      ),
      BoxShadow(
        color: Color.fromRGBO(10, 10, 10, 0.10),
        spreadRadius: 0.1,
        blurRadius: 20,
        offset: Offset(0, 4),
      ));

  final BoxShadow shadow;
  final BoxShadow btnShadow;

  const AppShadows(this.shadow, this.btnShadow);

  @override
  AppShadows copyWith({
    BoxShadow? shadow,
    BoxShadow? btnShadow,
  }) {
    return AppShadows(
      shadow ?? this.shadow,
      btnShadow ?? this.btnShadow,
    );
  }

  @override
  ThemeExtension<AppShadows> lerp(
      covariant ThemeExtension<AppShadows>? other, double t) {
    if (other is! AppShadows) {
      return this;
    }
    return AppShadows(other.shadow, other.btnShadow);
  }
}
