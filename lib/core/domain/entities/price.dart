class Price {
  late final int _min;
  late final int _max;
  late final String _currency;

  // Getters
  int get min => _min;
  int get max => _max;
  String get currency => _currency;

  // Constructor
  Price({
    required int min,
    required int max,
    required String currency,
  }) {
    _min = min;
    _max = max;
    _currency = currency;
  }

  // Factory method to create a Price object from a Map
  factory Price.fromMap(Map<String, dynamic> data) {
    return Price(
      min: data['min'],
      max: data['max'],
      currency: data['currency'],
    );
  }

  // Method to convert a Price object to a Map
  Map<String, dynamic> toMap() {
    return {
      'min': _min,
      'max': _max,
      'currency': _currency,
    };
  }
}
