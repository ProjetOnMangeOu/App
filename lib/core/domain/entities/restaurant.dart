import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';
import 'price.dart';
import 'restaurant_hours.dart';
import 'restaurant_service.dart';
import 'restaurant_types.dart';

part 'restaurant.g.dart';

@collection
class Restaurant extends ChangeNotifier {
  Id id = Isar.autoIncrement;
  late String _documentId;
  late String _name;
  late String _address;
  late double _lat;
  late double _long;
  late String _phone;
  late double _googleMapRating;
  late String? _image;
  late String _gmapLink;
  late String? _website;

  // Relationships
  final IsarLink<Price> price = IsarLink<Price>();
  final IsarLinks<RestaurantTypes> restaurantTypes = IsarLinks<RestaurantTypes>();
  final IsarLinks<RestaurantService> restaurantService = IsarLinks<RestaurantService>();
  final IsarLinks<RestaurantHours> restaurantHours = IsarLinks<RestaurantHours>();

  // Getters
  String get documentId => _documentId;
  String get name => _name;
  String get address => _address;
  double get lat => _lat;
  double get long => _long;
  String get phone => _phone;
  double get googleMapRating => _googleMapRating;
  String? get image => _image;
  String get gmapLink => _gmapLink;
  String? get website => _website;

  // Constructor
  Restaurant({
    required String documentId,
    required String name,
    required String address,
    required double lat,
    required double long,
    required String phone,
    required double googleMapRating,
    String? image,
    required String gmapLink,
    String? website,
  }) {
    _documentId = documentId;
    _name = name;
    _address = address;
    _lat = lat;
    _long = long;
    _phone = phone;
    _googleMapRating = googleMapRating;
    _image = image;
    _gmapLink = gmapLink;
    _website = website;
    notifyListeners();
  }

  // Factory method to create a Restaurant object from a Map
  factory Restaurant.fromMap(Map<String, dynamic> data, CacheAPI cacheAPI) {
    final restaurant = Restaurant(
      documentId: data['\$id'],
      name: data['name'],
      address: data['address'],
      lat: data['lat'],
      long: data['long'],
      phone: data['phone'],
      googleMapRating: data['googleMapRating'],
      image: data['image'],
      gmapLink: data['gmapLink'],
      website: data['website'],
    );

    if(data['price'] != null){
      final existingPrice = cacheAPI.fetchPriceByDocumentIdSync(documentId: data['price']['\$id']);
      if(existingPrice != null) {
        restaurant.price.value = existingPrice;
      } else {
        final newPrice = Price.fromMap(data['price']);
        cacheAPI.writePriceSync(price: newPrice);
        restaurant.price.value = newPrice;
      }
    }

    restaurant.restaurantTypes.addAll(
      (data['restaurantTypes'] as List).map((e) => RestaurantTypes.fromMap(e)),
    );
    restaurant.restaurantService.addAll(
      (data['restaurantService'] as List).map((e) => RestaurantService.fromMap(e)),
    );
    restaurant.restaurantHours.addAll(
      (data['restaurantHours'] as List).map((e) => RestaurantHours.fromMap(e)),
    );
    return restaurant;
  }

  // Method to convert a Restaurant object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _documentId,
      'name': _name,
      'address': _address,
      'lat': _lat,
      'long': _long,
      'phone': _phone,
      'googleMapRating': _googleMapRating,
      'image': _image,
      'gmapLink': _gmapLink,
      'website': _website,
      'price': price.value?.toMap(),
      'restaurantTypes': restaurantTypes.map((type) => type.toMap()).toList(),
      'restaurantService': restaurantService.map((service) => service.toMap()).toList(),
      'restaurantHours': restaurantHours.map((hours) => hours.toMap()).toList(),
    };
  }
}
