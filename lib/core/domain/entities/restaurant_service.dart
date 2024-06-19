import 'package:isar/isar.dart';

part 'restaurant_service.g.dart';

@collection
class RestaurantService {
  Id id = Isar.autoIncrement;
  late final String _documentId;
  late final String _name;
  late final List<String> _details;

  // Getters
  String get documentId => _documentId;
  String get name => _name;
  List<String> get details => _details;

  // Constructor
  RestaurantService({
    required String documentId,
    required String name,
    required List<String> details,
  }) {
    _documentId = documentId;
    _name = name;
    _details = details;
  }

  // Factory method to create a RestaurantService object from a Map
  factory RestaurantService.fromMap(Map<String, dynamic> data) {
    return RestaurantService(
      documentId: data['\$id'],
      name: data['name'],
      details: List<String>.from(data['details']),
    );
  }

  // Method to convert a RestaurantService object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _documentId,
      'name': _name,
      'details': _details,
    };
  }
}
