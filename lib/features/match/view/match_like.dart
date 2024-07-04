import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/avatar.dart';
import 'package:onmangeou/shared/widgets/elements/custom_button.dart';
import 'package:onmangeou/shared/widgets/elements/restaurant_pill.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchLikeView extends StatelessWidget {
  final List<String> restaurantIds;
  const MatchLikeView({super.key, required this.restaurantIds});

  @override
  Widget build(BuildContext context) {
    final restaurants = restaurantIds.map((id) {
      return context.read<RestaurantRepository>().getRestaurantByDocumentId(id);
    }).toList();

    return CustomScaffold(
      hideAppBar: true,
      gradientBackground: true,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      circlePosition: 1,
      children: [
        const SizedBox(),
        Column(
          children: [
            Text('Time to choose !', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white)),
            SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
            Text(
                textAlign: TextAlign.center,
                'You’ve already liked enough fantastic restaurants, and now it’s time to make a choice',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)
            ),
            SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
            Column(
              children: [
                for(var i = 0; i < restaurants.length; i++) Column(
                  children: [
                    RestaurantPill(restaurant: restaurants[i]),
                    if(restaurants.length > i) SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding)
                  ]
                )
              ],
            )
          ],
        ),
        CustomButton(text: 'close', type: ButtonType.ghost, onPressed: () {
          context.pop();
        }),
      ],
    );
  }
}
