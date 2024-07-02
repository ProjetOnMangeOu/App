import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:onmangeou/shared/widgets/elements/custom_button.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';

class EmailVerificationSentView extends StatefulWidget {
  const EmailVerificationSentView({super.key});

  @override
  EmailVerificationSentViewState createState() =>
      EmailVerificationSentViewState();
}

class EmailVerificationSentViewState extends State<EmailVerificationSentView> {
  late Duration remainingTime;
  Timer? timer;

  startTimer() {
    remainingTime = const Duration(seconds: AppConstants.resendEmailWaitTime);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime.inSeconds == 0) {
          t.cancel();
        } else {
          remainingTime = remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  resendEmail() {
    try {
      if (remainingTime.inSeconds > 0) return;

      startTimer();
      context
          .read<AuthAPI>()
          .sendEmailVerification(url: AppWriteConstants.emailVerificationUrl);
    } on AppwriteException catch (e) {
      Utils.logError(
          message:
              "RegisterEmailVerificationViewState: error while requesting email verification ",
          error: e);
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoHero(),
          SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
          Container(
            padding: EdgeInsets.all(
                Theme.of(context).extension<AppSizes>()!.padding),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(
                  Theme.of(context).extension<AppSizes>()!.borderRadius),
              boxShadow: [
                Theme.of(context).extension<AppShadows>()!.shadow,
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/images/mail-dynamic-color.png')),
                Text(
                  'We sent you an email',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'You\'re almost in! Check your email to verify your account and start discovering amazing restaurants near you. 🍽️',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomButton(
                  text: 'resend email (${remainingTime.inSeconds}s)',
                  onPressed: resendEmail,
                ),
                CustomButton(
                  text: 'cancel',
                  onPressed: () {
                    context.pop();
                  },
                  type: ButtonType.ghost,
                )
              ],
            ),
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
