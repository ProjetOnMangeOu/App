import 'package:flutter/foundation.dart';
import 'price.dart';
import 'restaurant_hours.dart';
import 'restaurant_service.dart';
import 'restaurant_type.dart';

class Restaurant extends ChangeNotifier {
  late final String _id;
  late final String _name;
  late final String _address;
  late final double _lat;
  late final double _long;
  late final String _phone;
  late final double _googleMapRating;
  late final String _image;
  late final String _gmapLink;
  late final String _website;

  // Relationships
  late final Price _price;
  late final RestaurantType _restaurantType;
  late final RestaurantService _restaurantService;
  late final RestaurantHours _restaurantHours;

  // Getters
  String get id => _id;
  String get name => _name;
  String get address => _address;
  double get lat => _lat;
  double get long => _long;
  String get phone => _phone;
  double get googleMapRating => _googleMapRating;
  String get image => _image;
  String get gmapLink => _gmapLink;
  String get website => _website;

  Price get price => _price;
  RestaurantType get restaurantType => _restaurantType;
  RestaurantService get restaurantService => _restaurantService;
  RestaurantHours get restaurantHours => _restaurantHours;

  // Constructor
  Restaurant({
    required String id,
    required String name,
    required String address,
    required double lat,
    required double long,
    required Price price,
    required String phone,
    required RestaurantType restaurantType,
    required double googleMapRating,
    required RestaurantService restaurantService,
    required RestaurantHours restaurantHours,
    required String image,
    required String gmapLink,
    required String website,
  }) {
    _id = id;
    _name = name;
    _address = address;
    _lat = lat;
    _long = long;
    _price = price;
    _phone = phone;
    _restaurantType = restaurantType;
    _googleMapRating = googleMapRating;
    _restaurantService = restaurantService;
    _restaurantHours = restaurantHours;
    _image = image;
    _gmapLink = gmapLink;
    _website = website;
    notifyListeners();
  }

  // Factory method to create a Restaurant object from a Map
  factory Restaurant.fromMap(Map<String, dynamic> data) {
    return Restaurant(
      id: data['\$id'],
      name: data['name'],
      address: data['address'],
      lat: data['lat'],
      long: data['long'],
      price: Price.fromMap(data['price']),
      phone: data['phone'],
      restaurantType: RestaurantType.fromMap(data['restaurantTypes']),
      googleMapRating: data['googleMapRating'],
      restaurantService: RestaurantService.fromMap(data['restaurantService']),
      restaurantHours: RestaurantHours.fromMap(data['restaurantHours']),
      image: data['image'],
      gmapLink: data['gmapLink'],
      website: data['website'],
    );
  }

  // Method to convert a Restaurant object to a Map
  Map<String, dynamic> toMap() {
    return {
      '\$id': _id,
      'name': _name,
      'address': _address,
      'lat': _lat,
      'long': _long,
      'price': _price.toMap(),
      'phone': _phone,
      'restaurantTypes': _restaurantType.toMap(),
      'googleMapRating': _googleMapRating,
      'restaurantService': _restaurantService.toMap(),
      'restaurantHours': _restaurantHours.toMap(),
      'image': _image,
      'gmapLink': _gmapLink,
      'website': _website,
    };
  }

  // Method to update a Restaurant object
  void update(Restaurant updatedRestaurant) {
    _name = updatedRestaurant.name;
    _address = updatedRestaurant.address;
    _lat = updatedRestaurant.lat;
    _long = updatedRestaurant.long;
    _price = updatedRestaurant.price;
    _phone = updatedRestaurant.phone;
    _restaurantType = updatedRestaurant.restaurantType;
    _googleMapRating = updatedRestaurant.googleMapRating;
    _restaurantService = updatedRestaurant.restaurantService;
    _restaurantHours = updatedRestaurant.restaurantHours;
    _image = updatedRestaurant.image;
    _gmapLink = updatedRestaurant.gmapLink;
    _website = updatedRestaurant.website;
    notifyListeners();
  }
}
