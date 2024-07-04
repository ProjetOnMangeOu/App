import 'package:flutter/material.dart';
import 'package:onmangeou/core/domain/entities/user.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:provider/provider.dart';

class DistanceText extends StatelessWidget {
  final double lat;
  final double long;
  final TextStyle? style;

  const DistanceText({super.key, required this.lat, required this.long, this.style});

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(
      builder: (context, user, child) {
        if (user?.position == null) {
          return Text('Calculating...', style: style);
        } else {
          double distance = (calculateDistanceInKm(lat: lat, long: long, position: user!.position!) * 10).round() / 10;
          return Text('$distance km', style: style);
        }
      },
    );
  }
}
