import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';

class Pill extends StatelessWidget {
  final String type;
  const Pill({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Theme.of(context).extension<AppSizes>()!.pillYPadding,
        horizontal: Theme.of(context).extension<AppSizes>()!.pillXPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        type,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
