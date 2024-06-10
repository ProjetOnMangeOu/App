import 'package:isar/isar.dart';

part 'price.g.dart';

@collection
class Price {
  Id id = Isar.autoIncrement;
  late final String _documentId;
  late final int _min;
  late final int _max;
  late final String _currency;

  // Getters
  String get documentId => _documentId;
  int get min => _min;
  int get max => _max;
  String get currency => _currency;

  // Constructor
  Price({
    required String documentId,
    required int min,
    required int max,
    required String currency,
  }) {
    _documentId = documentId;
    _min = min;
    _max = max;
    _currency = currency;
  }

  // Factory method to create a Price object from a Map
  factory Price.fromMap(Map<String, dynamic> data) {
    return Price(
      documentId: data['\$id'],
      min: data['min'],
      max: data['max'],
      currency: data['currency'],
    );
  }

  // Method to convert a Price object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _documentId,
      'min': _min,
      'max': _max,
      'currency': _currency,
    };
  }
}
