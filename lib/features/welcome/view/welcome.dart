import 'package:flutter/material.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      hideAppBar: true,
      children: [CircularProgressIndicator()],
    );
  }
}
