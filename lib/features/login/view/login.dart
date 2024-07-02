import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/custom_text_field.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/auth_form.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signInWithPassword(String email, String password) {
    try {
      context.read<AuthAPI>().loginWithPass(email: email, password: password);
    } on AppwriteException catch (e) {
      Utils.logError(
        message: "LoginViewState: error while signing in with password",
        error: e,
      );
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
              'Login Account',
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
            CustomTextField(
              controller: passwordController,
              labelText: 'password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ],
          onSubmit: () {
            if (_formKey.currentState!.validate()) {
              signInWithPassword(emailController.text, passwordController.text);
            }
          },
          submitButtonText: 'login',
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
            const Text('Forgot your password ?'),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/login/request-password');
              },
              child: const Text('RESET PASSWORD'),
            ),
          ],
        ),
      ],
    );
  }
}
