import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:onmangeou/shared/widgets/elements/restaurant_card.dart';
import 'package:provider/provider.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';

class RestaurantSwiper extends StatelessWidget {
  const RestaurantSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantRepository?>(
      builder: (context, restaurantRepository, child) {
        var restaurants = restaurantRepository?.watchedCells
            .expand((cell) => cell.restaurants)
            .toList() ?? [];

        if (restaurants.isEmpty) {
          return const Center(child: Text('No restaurants available.'));
        }

        return SizedBox(
          height: 800,
          child: CardSwiper(
            cardsCount: restaurants.length,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
              final restaurant = restaurants[index];
              final types = restaurant.restaurantTypes
                  .map((type) => type.name)
                  .join(', ');

              return RestaurantCard(
                name: restaurant.name,
                address: restaurant.address,
                types: types,
                imageUrl: restaurant.image,
              );
            },
            onSwipe: (
                int previousIndex,
                int? currentIndex,
                CardSwiperDirection direction,
                ) {
              print(
                'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
              );
              return true;
            },
            onEnd: () {
              print('No more cards left');
            },
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          ),
        );
      },
    );
  }
}
