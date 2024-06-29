import 'package:isar/isar.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';

part 'restaurant_types.g.dart';

@collection
class RestaurantTypes {
  Id id = Isar.autoIncrement;
  @Index()
  late final String documentId;
  late final String _name;

  // Getter
  String get name => _name;

  // Constructor
  RestaurantTypes({
    required this.documentId,
    required String name,
  }) {
    _name = name;
  }

  // Factory method to create a RestaurantType object from a Map
  factory RestaurantTypes.fromMap(Map<String, dynamic> data, CacheAPI cacheAPI) {
    final existingRestaurantType = cacheAPI.fetchRestaurantTypesByDocumentIdSync(documentId: data['\$id']);
    if(existingRestaurantType != null) {
      return existingRestaurantType;
    } else {
      return RestaurantTypes(
        documentId: data['\$id'],
        name: data['name'],
      );
    }
  }

  // Method to convert a RestaurantType object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': documentId,
      'name': _name,
    };
  }

  RestaurantTypes update(Map<String, dynamic> data, CacheAPI cacheAPI) {
    _name = data['name'];
    cacheAPI.writeRestaurantTypesSync(restaurantTypes: this);
    return this;
  }
}
