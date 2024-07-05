import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/shared/widgets/elements/restaurant_card.dart';
import 'package:onmangeou/shared/widgets/elements/round_button.dart';
import 'package:provider/provider.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';

class RestaurantSwiper extends StatefulWidget {
  const RestaurantSwiper({super.key});

  @override
  State<RestaurantSwiper> createState() => _RestaurantSwiperState();
}

class _RestaurantSwiperState extends State<RestaurantSwiper> {
  final List<String> likedRestaurantIds = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = (screenHeight / 3) * 2; // 2/3 of the screen height
    final screenWidth = MediaQuery.of(context).size.width;
    final CardSwiperController controller = CardSwiperController();

    return Consumer<RestaurantRepository?>(
      builder: (context, restaurantRepository, child) {
        var restaurants = restaurantRepository?.watchedCells
                .expand((cell) => cell.restaurants)
                .toList() ??
            [];

        if (restaurants.isEmpty) {
          return const Center(child: Text('No restaurants available.'));
        }

        return Column(
          children: [
            SizedBox(
              height: cardHeight,
              child: CardSwiper(
                controller: controller,
                isLoop: true,
                cardsCount: restaurants.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) {
                  final restaurant = restaurants[index];
                  final types = restaurant.restaurantTypes
                      .map((type) => type.name)
                      .toList();

                  return RestaurantCard(
                    restaurant: restaurant,
                    types: types,
                    height: cardHeight,
                    width: screenWidth,
                  );
                },
                onSwipe: (int previousIndex, int? currentIndex,
                    CardSwiperDirection direction) {
                  if (direction == CardSwiperDirection.top) {
                    context.push(
                        '/match?restaurantId=${restaurants[previousIndex].documentId}');
                  }
                  if (direction == CardSwiperDirection.right) {
                    likedRestaurantIds
                        .add(restaurants[previousIndex].documentId);
                    if (likedRestaurantIds.length >= 5) {
                      final queryParams = likedRestaurantIds.join(',');
                      likedRestaurantIds.clear();
                      context.push('/match-like?restaurantIds=$queryParams');
                    }
                  }
                  return true;
                },
                onEnd: () {
                  if (likedRestaurantIds.length > 1) {
                    context.push(
                        '/match-like?restaurantIds=${likedRestaurantIds.join(',')}');
                  } else if (likedRestaurantIds.isNotEmpty) {
                    context.push(
                        '/match?restaurantId=${likedRestaurantIds.first}');
                  }
                },
                allowedSwipeDirection: const AllowedSwipeDirection.only(
                    up: true, down: false, left: true, right: true),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.left),
                  child: const Image(
                    height: 35,
                    width: 35,
                    image: AssetImage(
                        'assets/images/thumb-down-dynamic-color.png'),
                  ),
                ),
                RoundButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.top),
                  child: const Image(
                    height: 35,
                    width: 35,
                    image: AssetImage('assets/images/fire-dynamic-color.png'),
                  ),
                ),
                RoundButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.right),
                  child: const Image(
                    height: 35,
                    width: 35,
                    image:
                        AssetImage('assets/images/thumb-up-dynamic-color.png'),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
