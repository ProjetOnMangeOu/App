import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/custom_text_field.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/auth_form.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  final String userId;
  final String secret;
  const ResetPasswordView(
      {super.key, required this.userId, required this.secret});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  resetPassword(
      {required String password,
      required String confirmPassword,
      required String userId,
      required String secret}) {
    try {
      context
          .read<AuthAPI>()
          .confirmPasswordReset(
              userId: userId,
              secret: secret,
              password: password,
              passwordAgain: confirmPassword)
          .then((res) {
        if (res['success'] == true) {
          context.go('/login');
        } else {
          Utils.logDebug(message: 'ResetPasswordViewState: not successful');
          // TODO: show error message to user
        }
      });
    } on AppwriteException catch (e) {
      Utils.logError(
          message: "ResetPasswordViewState: error while resetting password ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoHero(),
          AuthForm(
            formKey: _formKey,
            fields: [
              const Image(image: AssetImage('assets/images/key-dynamic-color.png')),
              Text(
                'Reset Password',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: confirmPasswordController,
                labelText: 'confirm password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                resetPassword(
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                  userId: widget.userId,
                  secret: widget.secret);
              }
            },
            submitButtonText: 'reset password',
            onCancel: () {
              context.pop();
            },
            cancelButtonText: 'cancel',
          ),
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
