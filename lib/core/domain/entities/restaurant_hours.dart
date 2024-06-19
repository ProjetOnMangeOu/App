import 'package:isar/isar.dart';

part 'restaurant_hours.g.dart';

@Collection()
class RestaurantHours {
  Id id = Isar.autoIncrement;
  late final String _documentId;
  late final String _openingTime;
  late final String _closingTime;
  late final String _dayOfWeek;

  // Getters
  String get documentId => _documentId;
  String get openingTime => _openingTime;
  String get closingTime => _closingTime;
  String get dayOfWeek => _dayOfWeek;

  // Constructor
  RestaurantHours({
    required String documentId,
    required String openingTime,
    required String closingTime,
    required String dayOfWeek,
  }) {
    _documentId = documentId;
    _openingTime = openingTime;
    _closingTime = closingTime;
    _dayOfWeek = dayOfWeek;
  }

  // Factory method to create a RestaurantHours object from a Map
  factory RestaurantHours.fromMap(Map<String, dynamic> data) {
    return RestaurantHours(
      documentId: data['\$id'],
      openingTime: data['openingTime'],
      closingTime: data['closingTime'],
      dayOfWeek: data['dayOfWeek'],
    );
  }

  // Method to convert a RestaurantHours object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _documentId,
      'openingTime': _openingTime,
      'closingTime': _closingTime,
      'dayOfWeek': _dayOfWeek,
    };
  }
}
