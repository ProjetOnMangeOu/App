import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/pill.dart';
import 'package:onmangeou/shared/widgets/elements/distance_text.dart';
import 'package:onmangeou/shared/widgets/elements/stars.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final List<String> types;
  final double height;
  final double width;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.types,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(Theme.of(context).extension<AppSizes>()!.borderRadius),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Theme.of(context).extension<AppSizes>()!.borderRadius),
                child: Image.network(
                  restaurant.image ?? 'https://picsum.photos/500',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Theme.of(context).extension<AppSizes>()!.borderRadius),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.35),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Theme.of(context).extension<AppSizes>()!.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: Theme.of(context).extension<AppSizes>()!.cardGap,
                    runSpacing: Theme.of(context).extension<AppSizes>()!.cardGap,
                    children: [
                      Text(
                        restaurant.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                      ),
                      for(var type in types) Pill(type: type),
                    ],
                  ),
                  SizedBox(height: Theme.of(context).extension<AppSizes>()!.cardGap),
                  Row(
                    children: [
                      DistanceText(
                        lat: restaurant.lat,
                        long: restaurant.long,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: Theme.of(context).extension<AppSizes>()!.cardGap),
                      Stars(rating: restaurant.googleMapRating)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}