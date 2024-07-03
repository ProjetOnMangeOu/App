import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/restaurant_swiper.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      circlePosition: 1,
      children: [
        const Text('Home'),
        RestaurantSwiper(),
        ElevatedButton(
          onPressed: () {
            context.read<AuthAPI>().logout();
          },
          child: const Text('logout'),
        ),
      ],
    );
  }
}
