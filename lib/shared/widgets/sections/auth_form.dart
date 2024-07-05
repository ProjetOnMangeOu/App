import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/custom_button.dart';

class AuthForm extends StatelessWidget {
  final List<Widget> fields;
  final VoidCallback onSubmit;
  final String submitButtonText;
  final VoidCallback? onCancel;
  final String? cancelButtonText;
  final GlobalKey<FormState> formKey;

  const AuthForm({
    super.key,
    required this.fields,
    required this.onSubmit,
    required this.submitButtonText,
    this.onCancel,
    this.cancelButtonText,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> addGaps(List<Widget> widgets) {
      return widgets.asMap().entries.map((entry) {
        int idx = entry.key;
        Widget widget = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: idx < widgets.length - 1
                ? Theme.of(context).extension<AppSizes>()!.padding
                : 0,
          ),
          child: widget,
        );
      }).toList();
    }

    return Container(
      padding: EdgeInsets.all(Theme.of(context).extension<AppSizes>()!.padding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(
            Theme.of(context).extension<AppSizes>()!.borderRadius),
        boxShadow: [
          Theme.of(context).extension<AppShadows>()!.shadow,
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: addGaps([
            ...fields,
            CustomButton(text: submitButtonText, onPressed: onSubmit),
            if (onCancel != null && cancelButtonText != null)
              CustomButton(
                  text: cancelButtonText!,
                  onPressed: onCancel!,
                  type: ButtonType.ghost),
          ]),
        ),
      ),
    );
  }
}
