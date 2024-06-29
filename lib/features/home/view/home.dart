import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Home'),
        Consumer<RestaurantRepository?>(
          builder: (context, restaurantRepository, child) {
            var restaurants = restaurantRepository?.watchedCells.expand((cell) => cell.restaurants).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  final types = restaurant.restaurantTypes.map((type) => type.name).join(', ');
                  return ListTile(
                    leading: restaurant.image != null ? Image.network(restaurant.image!) : null,
                    title: Text(restaurant.name),
                    subtitle: Text('${restaurant.address} - $types'),
                  );
                },
              ),
            );
          },
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
