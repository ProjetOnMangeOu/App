import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/logo_hero.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';

class EmailVerificationView extends StatefulWidget {
  final String userId;
  final String secret;
  const EmailVerificationView(
      {super.key, required this.userId, required this.secret});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  void initState() {
    super.initState();
    context
        .read<AuthAPI>()
        .confirmEmailVerification(userId: widget.userId, secret: widget.secret)
        .then((res) {
      if (res['success'] == false) {
        context.go('/register/email-verification-sent');
      } else {
        context.go('/');
      }
    });
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
            const Image(image: AssetImage('assets/images/mail-dynamic-color.png')),
            Text(
              'We are verifying your email...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const CircularProgressIndicator()
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
