import 'package:flutter/material.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/restaurant_swiper.dart';

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
    return const CustomScaffold(
      circlePosition: 1,
      children: [
        Text('Home'),
        RestaurantSwiper(),
      ],
    );
  }
}
