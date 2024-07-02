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
              children: addGaps([
                const Image(
                    image: AssetImage('assets/images/mail-dynamic-color.png')),
                Text(
                  'We sent you an email',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Password reset link sent! Check your email to regain access and continue discovering amazing restaurants near you. 🍽️',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomButton(
                  text: 'resend email (${remainingTime.inSeconds}s)',
                  onPressed: requestPasswordReset,
                ),
                CustomButton(
                  text: 'cancel',
                  onPressed: () {
                    context.pop();
                  },
                  type: ButtonType.ghost,
                )
              ]),
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
