import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/colors.dart';

enum ButtonType { primary, background, ghost, delete }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [Theme.of(context).extension<AppShadows>()!.btnShadow]),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            type == ButtonType.primary
                ? Theme.of(context).colorScheme.primary
                : type == ButtonType.background
                    ? const Color(AppColors.backgroundColor)
                    : type == ButtonType.ghost
                        ? AppColors.neutralSwatch[700]!.withOpacity(0.4)
                        : AppColors.secondarySwatch[600]!,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            (type == ButtonType.primary) || (type == ButtonType.background)
                ? Theme.of(context).colorScheme.onSurface
                : AppColors.neutralSwatch[50]!,
          ),
          overlayColor: type == ButtonType.background
              ? WidgetStateProperty.all<Color>(
                  AppColors.neutralSwatch[400]!.withOpacity(0.4))
              : null,
        ),
        onPressed: onPressed,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
