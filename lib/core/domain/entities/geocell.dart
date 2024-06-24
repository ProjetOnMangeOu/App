import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';

part 'geocell.g.dart';

@collection
class GeoCell {
  Id id = Isar.autoIncrement;

  late String minLatitude;
  late String maxLatitude;
  late String minLongitude;
  late String maxLongitude;

  @Index(composite: [CompositeIndex('maxLatitude'), CompositeIndex('maxLongitude')])
  late String minCoordinates;
  @Index(composite: [CompositeIndex('minLatitude'), CompositeIndex('minLongitude')])
  late String maxCoordinates;

  // Relationships
  final IsarLinks<Restaurant> restaurants = IsarLinks<Restaurant>();

  // Constructor
  GeoCell({
    required this.minLatitude,
    required this.maxLatitude,
    required this.minLongitude,
    required this.maxLongitude,
  }) {
    // Create composite index strings
    minCoordinates = '$minLatitude,$minLongitude';
    maxCoordinates = '$maxLatitude,$maxLongitude';
  }
}
