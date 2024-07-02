import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/custom_text_field.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/auth_form.dart';
import 'package:provider/provider.dart';

class RequestPasswordResetView extends StatefulWidget {
  const RequestPasswordResetView({super.key});

  @override
  State<RequestPasswordResetView> createState() =>
      _RequestPasswordResetViewState();
}

class _RequestPasswordResetViewState extends State<RequestPasswordResetView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  requestPasswordReset(String email) {
    try {
      context
          .read<AuthAPI>()
          .requestPasswordReset(
              email: email, url: AppWriteConstants.resetPasswordUrl)
          .then((res) {
        if (res['success'] == true) {
          context.push('/login/request-password-sent',
              extra: {'email': emailController.text});
        } else {
          Utils.logDebug(
              message: 'RequestPasswordResetViewState: not successful');
          // TODO: show error message to user
        }
      });
    } on AppwriteException catch (e) {
      Utils.logError(
          message:
              "RequestPasswordResetViewState: error while requesting password reset ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoHero(),
          SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
          AuthForm(
            formKey: _formKey,
            fields: [
              Text(
                'Reset Password',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ],
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                requestPasswordReset(emailController.text);
              }
            },
            submitButtonText: 'send email',
            onCancel: () {
              context.pop();
            },
            cancelButtonText: 'cancel',
          ),
          SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Don’t have an account ?'),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/register');
                },
                child: const Text('REGISTER'),
              ),
            ],
          )
        ]);
  }
}
