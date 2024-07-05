import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/elements/avatar.dart';
import 'package:onmangeou/shared/widgets/elements/pill.dart';
import 'package:onmangeou/shared/widgets/elements/stars.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantPill extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantPill({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final types = restaurant.restaurantTypes.map((type) => type.name).toList();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Avatar(
            imageUrl: restaurant.image ?? 'https://picsum.photos/500',
          ),
          SizedBox(
              width: Theme.of(context).extension<AppSizes>()!.pillYPadding),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Theme.of(context).extension<AppSizes>()!.pillYPadding,
                horizontal:
                    Theme.of(context).extension<AppSizes>()!.pillYPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                      ),
                      ...types.map((type) => Padding(
                            padding: EdgeInsets.only(
                                left: Theme.of(context)
                                    .extension<AppSizes>()!
                                    .cardGap),
                            child: Pill(type: type),
                          )),
                    ],
                  ),
                  Stars(rating: restaurant.googleMapRating),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse(restaurant.gmapLink),
                    mode: LaunchMode.externalApplication);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              child: const Icon(TablerIcons.arrow_forward_up, size: 30))
          // const SizedBox(width: 75, child: )
        ],
      ),
    );
  }
}
