import 'package:flutter/widgets.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    double roundedRating = (rating * 2).round() / 2;

    return Flex(direction: Axis.horizontal, children: [
      for (var i = 0; i < 5; i++)
        Image.asset(i < roundedRating
            ? 'assets/images/star-dynamic-color.png'
            : 'assets/images/star-dynamic-clay.png',
        width: 25, height: 25),
    ]);
  }
}

