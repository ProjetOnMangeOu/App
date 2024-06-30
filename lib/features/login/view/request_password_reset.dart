import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';

class RequestPasswordResetView extends StatefulWidget {
  const RequestPasswordResetView({super.key});

  @override
  State<RequestPasswordResetView> createState() =>
      _RequestPasswordResetViewState();
}

class _RequestPasswordResetViewState extends State<RequestPasswordResetView> {
  final TextEditingController emailController = TextEditingController();

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
                const Image(image: AssetImage('assets/images/key-dynamic-color.png')),
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'email',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    requestPasswordReset(emailController.text);
                  },
                  child: const Text('send email'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('cancel'),
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
                  GoRouter.of(context).go('/register');
                },
                child: const Text('REGISTER'),
              ),
            ],
          )
        ]
    );
  }
}
