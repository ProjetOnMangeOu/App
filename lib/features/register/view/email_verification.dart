import 'package:flutter/material.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:provider/provider.dart';

class EmailVerificationView extends StatefulWidget {
  final String userId;
  final String secret;
  const EmailVerificationView({super.key, required this.userId, required this.secret});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthAPI>().confirmEmailVerification(
        userId: widget.userId, secret: widget.secret);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CircularProgressIndicator());
  }
}

