import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';

@collection
class GeoCell {
  Id id = Isar.autoIncrement;
  late double _minLatitude;
  late double _maxLatitude;
  late double _minLongitude;
  late double _maxLongitude;

  // Relationships
  final IsarLinks<Restaurant> restaurants = IsarLinks<Restaurant>();

  // Getters
  double get minLatitude => _minLatitude;
  double get maxLatitude => _maxLatitude;
  double get minLongitude => _minLongitude;
  double get maxLongitude => _maxLongitude;

  // Constructor
  GeoCell({
    required double minLatitude,
    required double maxLatitude,
    required double minLongitude,
    required double maxLongitude,
  }) {
    _minLatitude = minLatitude;
    _maxLatitude = maxLatitude;
    _minLongitude = minLongitude;
    _maxLongitude = maxLongitude;
  }
}