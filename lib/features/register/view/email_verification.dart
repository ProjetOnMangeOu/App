import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
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
    return const Scaffold(body: Text('Email verification in progress...'));
  }
}
