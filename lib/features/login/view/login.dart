import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';

import 'package:onmangeou/shared/widgets/buttons.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signInWithPassword(String email, String password) {
    try {
      context.read<AuthAPI>().loginWithPass(email: email, password: password);
    } on AppwriteException catch (e) {
      Utils.logError(
          message: "LoginViewState: error while signing with password ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoHero(),

          Container(
            padding: EdgeInsets.all(Theme.of(context)
                .extension<AppSizes>()!
                .padding),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .surface,
              borderRadius: BorderRadius.circular(Theme.of(context)
                  .extension<AppSizes>()!
                  .borderRadius),
              boxShadow: [
                Theme.of(context)
                    .extension<AppShadows>()!
                    .shadow,
              ],

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login Account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'email',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'password',
                  ),
                ),
                OMGUButtons(
                  text: 'LOGIN',
                  onPressed: () {
                    signInWithPassword(
                        emailController.text, passwordController.text);
                  },
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Don’t have an account ?'),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push('/register');
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
          )
        ]);
  }
}
