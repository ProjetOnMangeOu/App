import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';

part 'geocell.g.dart';

@collection
class GeoCell {
  Id id = Isar.autoIncrement;

  @Index()
  late String minLatitude;
  @Index()
  late String maxLatitude;
  @Index()
  late String minLongitude;
  @Index()
  late String maxLongitude;

  @Index(composite: [CompositeIndex('minLatitude'), CompositeIndex('maxLatitude'), CompositeIndex('minLongitude')])
  late String maxLongitudeComposite;

  // Relationships
  final IsarLinks<Restaurant> restaurants = IsarLinks<Restaurant>();

  // Constructor
  GeoCell({
    required this.minLatitude,
    required this.maxLatitude,
    required this.minLongitude,
    required this.maxLongitude,
  }) {
    minLatitude = minLatitude;
    maxLatitude = maxLatitude;
    minLongitude = minLongitude;
    maxLongitude = maxLongitude;

    // Create a composite index string
    maxLongitudeComposite = maxLongitude;
  }
}
