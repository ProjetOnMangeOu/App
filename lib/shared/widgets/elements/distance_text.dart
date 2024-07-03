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
    double functionCalculateDistance() {
      final position = context.read<User?>()?.position;
      return position != null ? (calculateDistanceInKm(lat: lat, long: long, position: position)*10).round() / 10 : 0.0;
    }

    return Text('${functionCalculateDistance()} km', style: style);
  }
}
