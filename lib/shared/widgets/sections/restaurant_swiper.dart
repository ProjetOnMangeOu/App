import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/shared/widgets/elements/restaurant_card.dart';
import 'package:provider/provider.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';

class RestaurantSwiper extends StatelessWidget {
  const RestaurantSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = (screenHeight / 3) * 2; // 2/3 of the screen height
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<RestaurantRepository?>(
      builder: (context, restaurantRepository, child) {
        var restaurants = restaurantRepository?.watchedCells
            .expand((cell) => cell.restaurants)
            .toList() ?? [];

        if (restaurants.isEmpty) {
          return const Center(child: Text('No restaurants available.'));
        }

        return SizedBox(
          height: cardHeight,
          child: CardSwiper(
            cardsCount: restaurants.length,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
              final restaurant = restaurants[index];
              final types = restaurant.restaurantTypes.map((type) => type.name).toList();

              return RestaurantCard(
                restaurant: restaurant,
                types: types,
                height: cardHeight,
                width: screenWidth,
              );
            },
            onSwipe: (int previousIndex, int? currentIndex, CardSwiperDirection direction) {
              print(
                'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
              );
              if(direction == CardSwiperDirection.top) {
                context.push('/match?restaurantId=${restaurants[currentIndex!].documentId}');
              }
              return true;
            },
            onEnd: () {
              print('No more cards left');
            },
            allowedSwipeDirection: const AllowedSwipeDirection.only(up: true, down: false, left: true, right: true),
          ),
        );
      },
    );
  }
}
