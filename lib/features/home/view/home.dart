import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/core/infrastructure/restaurant_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  void getRestaurants() {
    Utils.logDebug(message: '[Home] Getting restaurants...');
    context.read<RestaurantAPI>().getRestaurants();
    // Trigger fetching restaurants with geo-location
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
        Consumer<RestaurantAPI>(
          builder: (context, restaurantAPI, child) {
            return Text('Restaurants: ${restaurantAPI.restaurants.length}');
          },
        ),
        Expanded(
          child: Consumer<RestaurantAPI>(
            builder: (context, restaurantAPI, child) {
              return ListView.builder(
                itemCount: restaurantAPI.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurantAPI.restaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                  );
                },
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
