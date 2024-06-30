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
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';

class RequestPasswordSentView extends StatefulWidget {
  final String email;
  const RequestPasswordSentView({super.key, required this.email});

  @override
  State<RequestPasswordSentView> createState() =>
      _RequestPasswordSentViewState();
}

class _RequestPasswordSentViewState extends State<RequestPasswordSentView> {
  Duration remainingTime =
      const Duration(seconds: AppConstants.resendEmailWaitTime);
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime.inSeconds == 0) {
          t.cancel();
          remainingTime =
              const Duration(seconds: AppConstants.resendEmailWaitTime);
        } else {
          remainingTime = remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  requestPasswordReset() {
    try {
      if (remainingTime.inSeconds > 0) return;

      startTimer();
      context.read<AuthAPI>().requestPasswordReset(
          email: widget.email, url: AppWriteConstants.resetPasswordUrl);
    } on AppwriteException catch (e) {
      Utils.logError(
          message:
              "RequestPasswordSentViewState: error while requesting password reset ",
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
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Password reset link sent! Check your email to regain access and continue discovering amazing restaurants near you. 🍽️',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    // resend email
                    requestPasswordReset();
                  },
                  child: Text('resend email (${remainingTime.inSeconds}s)'),
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
        ]);
  }
}
