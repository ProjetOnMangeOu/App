class RestaurantService {
  late final String _name;
  late final List<String> _details;
  late final String _restaurantId;

  // Getters
  String get name => _name;
  List<String> get details => _details;
  String get restaurantId => _restaurantId;

  // Constructor
  RestaurantService({
    required String name,
    required List<String> details,
    required String restaurantId,
  }) {
    _name = name;
    _details = details;
    _restaurantId = restaurantId;
  }

  // Factory method to create a RestaurantService object from a Map
  factory RestaurantService.fromMap(Map<String, dynamic> data) {
    return RestaurantService(
      name: data['name'],
      details: List<String>.from(data['details']),
      restaurantId: data['restaurant'],
    );
  }

  // Method to convert a RestaurantService object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'details': _details,
      'restaurant': _restaurantId,
    };
  }
}
