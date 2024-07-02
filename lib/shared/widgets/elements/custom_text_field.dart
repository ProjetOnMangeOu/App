import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: theme.colorScheme.tertiary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: AppColors.secondarySwatch[700]!,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: AppColors.secondarySwatch[700]!,
            width: 2,
          ),
        ),
        labelText: labelText,
        floatingLabelStyle: TextStyle(
          color: AppColors.neutralSwatch[700],
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: Theme.of(context).extension<AppSizes>()!.inputPadding),
      ),
      validator: validator,
    );
  }
}
