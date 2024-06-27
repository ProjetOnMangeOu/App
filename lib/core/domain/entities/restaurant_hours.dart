import 'package:isar/isar.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';

part 'restaurant_hours.g.dart';

@Collection()
class RestaurantHours {
  Id id = Isar.autoIncrement;
  @Index()
  late final String documentId;
  late final String _openingTime;
  late final String _closingTime;
  late final String _dayOfWeek;

  // Getters
  String get openingTime => _openingTime;
  String get closingTime => _closingTime;
  String get dayOfWeek => _dayOfWeek;

  // Constructor
  RestaurantHours({
    required this.documentId,
    required String openingTime,
    required String closingTime,
    required String dayOfWeek,
  }) {
    _openingTime = openingTime;
    _closingTime = closingTime;
    _dayOfWeek = dayOfWeek;
  }

  // Factory method to create a RestaurantHours object from a Map
  factory RestaurantHours.fromMap(Map<String, dynamic> data, CacheAPI cacheAPI) {
    final existingRestaurantHours = cacheAPI.fetchRestaurantHoursByDocumentIdSync(documentId: data['\$id']);
    if(existingRestaurantHours != null) {
      return existingRestaurantHours;
    } else {
      return RestaurantHours(
        documentId: data['\$id'],
        openingTime: data['openingTime'],
        closingTime: data['closingTime'],
        dayOfWeek: data['dayOfWeek'],
      );
    }
  }

  // Method to convert a RestaurantHours object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': documentId,
      'openingTime': _openingTime,
      'closingTime': _closingTime,
      'dayOfWeek': _dayOfWeek,
    };
  }
}
