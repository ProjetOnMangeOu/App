class RestaurantType {
  late final String _name;

  // Getter
  String get name => _name;

  // Constructor
  RestaurantType({
    required String name,
  }) {
    _name = name;
  }

  // Factory method to create a RestaurantType object from a Map
  factory RestaurantType.fromMap(Map<String, dynamic> data) {
    return RestaurantType(
      name: data['name'],
    );
  }

  // Method to convert a RestaurantType object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': _name,
    };
  }
}
