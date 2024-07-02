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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
          AuthForm(
            formKey: _formKey,
            fields: [
              const Image(image: AssetImage('assets/images/key-dynamic-color.png')),
              Text(
                'Register Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CustomTextField(
                controller: usernameController,
                labelText: 'username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid email';
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
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: passwordConfirmController,
                labelText: 'confirm password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value != passwordController.text) {
                    return 'Your passwords do not match';
                  }
                  return null;
                },
              ),
            ],
            onSubmit: () {
              if (_formKey.currentState!.validate()) {
                  registerAccount(
                      usernameController.text,
                      emailController.text,
                      passwordController.text,
                      passwordConfirmController.text);
              }
            },
            submitButtonText: 'register',
          ),
          SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
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
        ]);
  }
}
