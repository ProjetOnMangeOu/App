import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/core/infrastructure/restaurant_api.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List<Restaurant> restaurants = [];


  void getRestaurants() async {
    restaurants = (await context.read<RestaurantAPI?>()?.getRestaurants()) ?? [];
  }

  @override
  void initState() {
    super.initState();
    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Home'),
        Expanded(
          child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return ListTile(
                title: Text(restaurant.name),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthAPI>().logout();
          },
          child: const Text('logout'),
        ),
      ]),
    );
  }
}
