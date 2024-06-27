import 'package:isar/isar.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';

part 'restaurant_service.g.dart';

@collection
class RestaurantService {
  Id id = Isar.autoIncrement;
  @Index()
  late final String documentId;
  late final String _name;
  late final List<String> _details;

  // Getters
  String get name => _name;
  List<String> get details => _details;

  // Constructor
  RestaurantService({
    required this.documentId,
    required String name,
    required List<String> details,
  }) {
    _name = name;
    _details = details;
  }

  // Factory method to create a RestaurantService object from a Map
  factory RestaurantService.fromMap(Map<String, dynamic> data, CacheAPI cacheAPI) {
    final existingRestaurantService = cacheAPI.fetchRestaurantServiceByDocumentIdSync(documentId: data['\$id']);
    if(existingRestaurantService != null) {
      return existingRestaurantService;
    } else {
      return RestaurantService(
        documentId: data['\$id'],
        name: data['name'],
        details: List<String>.from(data['details']),
      );
    }
  }

  // Method to convert a RestaurantService object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': documentId,
      'name': _name,
      'details': _details,
    };
  }
}
