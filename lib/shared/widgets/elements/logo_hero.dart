import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';

class LogoHero extends StatelessWidget {
  const LogoHero({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.4;
    double leftPadding = screenWidth * 0.03;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: leftPadding,
            bottom: Theme.of(context).extension<AppSizes>()!.padding,
          ),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: imageWidth,
          ),
        ),
        Text(
          'On Mange Où ?',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.white,
              ),
        )
      ],
    );
  }
}
