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

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  registerAccount(
      String username, String email, String password, String passwordConfirm) {
    try {
      context
          .read<AuthAPI>()
          .registerAccount(email: email, password: password, username: username)
          .then((res) {
        if (res['success'] == true) {
          context.push('/register/email-verification-sent');
        } else {
          // TODO : Add error feedback
          Utils.logDebug(
              message: "RegisterViewState: unsuccessful registration");
        }
      });
    } on AppwriteException catch (e) {
      Utils.logError(
          message: "RegisterViewState: error while registering account",
          error: e);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
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
                  'Register Account',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'username',
                  ),
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
                TextField(
                  controller: passwordConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'confirm password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    registerAccount(usernameController.text, emailController.text,
                        passwordController.text, passwordConfirmController.text);
                  },
                  child: const Text('register'),
                ),
              ],
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Already have an account ?'),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/login');
                },
                child: const Text('LOGIN'),
              ),
            ],
          )
        ]
    );
  }
}
