import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Map<String, double> calculateBoundingBox(
    {required Position position, required int distanceMeters}) {
  final double latRadians = position.latitude * (pi / 180);
  const degLatKm = 110.574235;
  final degLongKm = 110.572833 * cos(latRadians);
  final distanceKm = distanceMeters / 1000;
  final deltaLat = distanceKm / degLatKm;
  final deltaLong = distanceKm / degLongKm;

  return {
    'minLat': position.latitude - deltaLat,
    'maxLat': position.latitude + deltaLat,
    'minLong': position.longitude - deltaLong,
    'maxLong': position.longitude + deltaLong,
  };
}

List<Map<String, double>> calculateGridCells({
  required double minLat,
  required double maxLat,
  required double minLong,
  required double maxLong,
}) {
  const double cellSize = 0.1;

  List<Map<String, double>> gridCells = [];

  // Itération sur les cellules de la grille
  for (double lat = (minLat / cellSize).floor() * cellSize;
      lat < maxLat;
      lat += cellSize) {
    for (double long = (minLong / cellSize).floor() * cellSize;
        long < maxLong;
        long += cellSize) {
      // Coordonnées de la cellule
      double cellMinLat = double.parse(lat.toStringAsFixed(1));
      double cellMaxLat = double.parse((lat + cellSize).toStringAsFixed(1));
      double cellMinLong = double.parse(long.toStringAsFixed(1));
      double cellMaxLong = double.parse((long + cellSize).toStringAsFixed(1));

      // Vérification d'intersection avec le bounding box
      if (!(cellMaxLat <= minLat ||
          cellMinLat >= maxLat ||
          cellMaxLong <= minLong ||
          cellMinLong >= maxLong)) {
        // Si la cellule intersecte le bounding box, l'ajouter à la liste
        gridCells.add({
          'minLat': cellMinLat,
          'maxLat': cellMaxLat,
          'minLong': cellMinLong,
          'maxLong': cellMaxLong,
        });
      }
    }
  }

  return gridCells;
}

//TODO: ajouter une méthode qui calcule la distance en mètres entre deux points GPS
