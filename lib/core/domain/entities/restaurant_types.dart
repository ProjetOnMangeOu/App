import 'package:isar/isar.dart';

part 'restaurant_types.g.dart';

@collection
class RestaurantTypes {
  Id id = Isar.autoIncrement;
  late final String _documentId;
  late final String _name;

  // Getter
  String get documentId => _documentId;
  String get name => _name;

  // Constructor
  RestaurantTypes({
    required String documentId,
    required String name,
  }) {
    _documentId = documentId;
    _name = name;
  }

  // Factory method to create a RestaurantType object from a Map
  factory RestaurantTypes.fromMap(Map<String, dynamic> data) {
    return RestaurantTypes(
      documentId: data['\$id'],
      name: data['name'],
    );
  }

  // Method to convert a RestaurantType object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _documentId,
      'name': _name,
    };
  }
}
