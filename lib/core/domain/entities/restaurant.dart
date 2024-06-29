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
  @Index()
  late String documentId;
  late String _name;
  late String _address;
  late double _lat;
  late double _long;
  late String? _phone;
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
  String get name => _name;
  String get address => _address;
  double get lat => _lat;
  double get long => _long;
  String? get phone => _phone;
  double get googleMapRating => _googleMapRating;
  String? get image => _image;
  String get gmapLink => _gmapLink;
  String? get website => _website;

  // Constructor
  Restaurant({
    required this.documentId,
    required String name,
    required String address,
    required double lat,
    required double long,
    String? phone,
    required double googleMapRating,
    String? image,
    required String gmapLink,
    String? website,
  }) {
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
    final existingRestaurant = cacheAPI.fetchRestaurantByDocumentIdSync(documentId: data['\$id']);
    if(existingRestaurant != null) {
      return existingRestaurant.update(data, cacheAPI);
    } else {
      final restaurant = Restaurant(
        documentId: data['\$id'],
        name: data['name'],
        address: data['address'],
        lat: double.tryParse(data['lat'].toString()) ?? 0.0,
        long: double.tryParse(data['long'].toString()) ?? 0.0,
        phone: data['phone'],
        googleMapRating: double.tryParse(data['googleMapRating'].toString()) ?? 0.0,
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
        (data['restaurantTypes'] as List).map((e) => RestaurantTypes.fromMap(e, cacheAPI)),
      );
      restaurant.restaurantService.addAll(
        (data['restaurantService'] as List).map((e) => RestaurantService.fromMap(e, cacheAPI)),
      );
      restaurant.restaurantHours.addAll(
        (data['restaurantHours'] as List).map((e) => RestaurantHours.fromMap(e, cacheAPI)),
      );
      return restaurant;
    }
  }

  // Method to convert a Restaurant object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': documentId,
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

  Restaurant update(Map<String, dynamic> data, CacheAPI cacheAPI) {
    if (data.containsKey('name')) {
      _name = data['name'];
    }
    if (data.containsKey('address')) {
      _address = data['address'];
    }
    if (data.containsKey('lat')) {
      _lat = double.tryParse(data['lat'].toString()) ?? 0.0;
    }
    if (data.containsKey('long')) {
      _long = double.tryParse(data['long'].toString()) ?? 0.0;
    }
    if (data.containsKey('phone')) {
      _phone = data['phone'];
    }
    if (data.containsKey('googleMapRating')) {
      _googleMapRating = double.tryParse(data['googleMapRating'].toString()) ?? 0.0;
    }
    if (data.containsKey('image')) {
      _image = data['image'];
    }
    if (data.containsKey('gmapLink')) {
      _gmapLink = data['gmapLink'];
    }
    if (data.containsKey('website')) {
      _website = data['website'];
    }

    cacheAPI.resetRestaurantLinks(restaurant: this);

    restaurantTypes.clear();
    restaurantTypes.addAll(
      (data['restaurantTypes'] as List).map((e) => RestaurantTypes.fromMap(e, cacheAPI)),
    );
    restaurantService.clear();
    restaurantService.addAll(
      (data['restaurantService'] as List).map((e) => RestaurantService.fromMap(e, cacheAPI)),
    );
    restaurantHours.clear();
    restaurantHours.addAll(
      (data['restaurantHours'] as List).map((e) => RestaurantHours.fromMap(e, cacheAPI)),
    );
    cacheAPI.writeRestaurantSync(restaurant: this);
    notifyListeners();
    return this;
  }

}
