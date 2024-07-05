import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/entities/user.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/theme/colors.dart';
import 'package:onmangeou/shared/widgets/elements/avatar.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_scaffold.dart';
import 'package:onmangeou/shared/widgets/sections/restaurant_swiper.dart';
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
    final username = context.read<User?>()?.username ?? 'User';

    return CustomScaffold(
      circlePosition: 1,
      children: [
        Row(
          children: [
            Avatar(
                image: Image.asset('assets/images/boy-dynamic-color.png'),
                size: 50,
                displayBorder: false),
            SizedBox(width: Theme.of(context).extension<AppSizes>()!.padding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, $username',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.neutralSwatch[50])),
                Text('where do you wanna eat ?',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.neutralSwatch[50])),
              ],
            ),
          ],
        ),
        const RestaurantSwiper(),
      ],
    );
  }
}
