import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/theme/colors.dart';
import 'package:onmangeou/shared/widgets/elements/distance_text.dart';
import 'package:onmangeou/shared/widgets/elements/pill.dart';
import 'package:onmangeou/shared/widgets/elements/round_button.dart';
import 'package:onmangeou/shared/widgets/elements/stars.dart';
import 'package:provider/provider.dart';

class RestaurantDetailsView extends StatefulWidget {
  final String restaurantId;
  const RestaurantDetailsView({
    super.key,
    required this.restaurantId,
  });

  @override
  State<RestaurantDetailsView> createState() => _RestaurantDetailsViewState();
}

class _RestaurantDetailsViewState extends State<RestaurantDetailsView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final restaurant = context
        .read<RestaurantRepository>()
        .getRestaurantByDocumentId(widget.restaurantId);
    final types = restaurant.restaurantTypes.map((type) => type.name).toList();
    final priceMin = restaurant.price.value?.min ?? 0;
    final priceMax = restaurant.price.value?.max ?? 0;

    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SizedBox(
              height: (screenHeight * 2 / 5),
              child: Image.network(
                restaurant.image ?? 'https://picsum.photos/1000',
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: SafeArea(
              child: RoundButton(
                  onPressed: () => context.pop(),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: const Icon(TablerIcons.arrow_forward_up, size: 30),
                  )),
            )),
        Positioned.fill(
          top: (screenHeight / 3),
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    Theme.of(context).extension<AppSizes>()!.borderRadius),
                topRight: Radius.circular(
                    Theme.of(context).extension<AppSizes>()!.borderRadius),
              ),
              boxShadow: [Theme.of(context).extension<AppShadows>()!.shadow],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    Theme.of(context).extension<AppSizes>()!.padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: Theme.of(context)
                                .extension<AppSizes>()!
                                .pillYPadding,
                            runSpacing: Theme.of(context)
                                .extension<AppSizes>()!
                                .pillYPadding,
                            children: [
                              Text(
                                restaurant.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.titleMedium!,
                              ),
                              ...types.map((type) => Pill(type: type)),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Theme.of(context)
                                    .extension<AppSizes>()!
                                    .cardGap),
                            child: Stars(rating: restaurant.googleMapRating))
                      ],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.cardGap),
                    Row(
                      children: [
                        const Icon(TablerIcons.location, size: 15),
                        SizedBox(
                            width: Theme.of(context)
                                .extension<AppSizes>()!
                                .pillYPadding),
                        Text("${restaurant.address} • ",
                            style: Theme.of(context).textTheme.labelSmall),
                        DistanceText(
                            lat: restaurant.lat,
                            long: restaurant.long,
                            style: Theme.of(context).textTheme.labelSmall)
                      ],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.padding),
                    Container(
                      height: 2,
                      color: AppColors.neutralSwatch[200],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.padding),
                    Row(
                      children: [
                        const Icon(TablerIcons.currency_euro, size: 15),
                        SizedBox(
                            width: Theme.of(context)
                                .extension<AppSizes>()!
                                .pillYPadding),
                        Text('$priceMin - $priceMax',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.cardGap),
                    Row(
                      children: [
                        const Icon(TablerIcons.phone, size: 15),
                        SizedBox(
                            width: Theme.of(context)
                                .extension<AppSizes>()!
                                .pillYPadding),
                        Text('${restaurant.phone}',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.padding),
                    Container(
                      height: 2,
                      color: AppColors.neutralSwatch[200],
                    ),
                    SizedBox(
                        height:
                            Theme.of(context).extension<AppSizes>()!.padding),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: restaurant.restaurantService.length,
                      itemBuilder: (context, index) {
                        final service =
                            restaurant.restaurantService.toList()[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                  height: Theme.of(context)
                                      .extension<AppSizes>()!
                                      .cardGap),
                              Wrap(
                                spacing: Theme.of(context)
                                    .extension<AppSizes>()!
                                    .cardGap,
                                children: service.details.map((detail) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(TablerIcons.check, size: 15),
                                      SizedBox(
                                          width: Theme.of(context)
                                              .extension<AppSizes>()!
                                              .pillYPadding),
                                      Flexible(
                                        child: Text(
                                          detail,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
