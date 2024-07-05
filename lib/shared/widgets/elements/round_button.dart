import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: [Theme.of(context).extension<AppShadows>()!.btnShadow]),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            padding: EdgeInsets.all(
                Theme.of(context).extension<AppSizes>()!.inputPadding),
          ),
          child: child,
        ));
  }
}
