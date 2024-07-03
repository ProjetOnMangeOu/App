import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/avatar.dart';
import 'package:onmangeou/shared/widgets/elements/custom_button.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchView extends StatelessWidget {
  final String restaurantId;
  const MatchView({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<RestaurantRepository>().getRestaurantByDocumentId(restaurantId);

    return CustomScaffold(
      gradientBackground: true,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      circlePosition: 1,
      children: [
        const SizedBox(),
        Column(
          children: [
            Text('Time to eat !', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white)),
            SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
            Text(
              textAlign: TextAlign.center,
              'You and ${restaurant.name} are in for a treat !',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)
            ),
            SizedBox(height: Theme.of(context).extension<AppSizes>()!.padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(imageUrl: restaurant.image ?? 'https://via.placeholder.com/75'),
                SizedBox(width: Theme.of(context).extension<AppSizes>()!.padding),
                Avatar(image: Image.asset('assets/images/boy-dynamic-color.png')),
              ],
            ),
          ],
        ),
        Column(
          children: [
            CustomButton(text: 'open map', type: ButtonType.background, onPressed: () {
              launchUrl(Uri.parse(restaurant.gmapLink), mode: LaunchMode.externalApplication);
            }),
            CustomButton(text: 'close', type: ButtonType.ghost, onPressed: () {
              context.pop();
            }),
          ],
        )
      ],
    );
  }
}
