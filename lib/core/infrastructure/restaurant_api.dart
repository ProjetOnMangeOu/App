import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart' as Isar;
import 'package:onmangeou/core/domain/entities/price.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/domain/entities/restaurant_hours.dart';
import 'package:onmangeou/core/domain/entities/restaurant_service.dart';
import 'package:onmangeou/core/domain/entities/restaurant_types.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class RestaurantAPI extends ChangeNotifier {
  Client client = Client();
  late final Databases database;
  late final Isar.Isar isar;
  List<Restaurant> restaurants = [];

  // Constructor
  RestaurantAPI() {
    initClient();
    initIsar();
  }

  // Initialize the Appwrite client
  void initClient() {
    client
        .setEndpoint(AppWriteConstants.endpoint)
        .setProject(AppWriteConstants.projectId)
        .setSelfSigned(status: kReleaseMode ? false : true);
    database = Databases(client);
  }

  // Initialize Isar
  Future<void> initIsar() async {
    Utils.logDebug(message: '[RestaurantAPI] Initializing Isar...');
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.Isar.open(
      [RestaurantSchema, PriceSchema, RestaurantTypesSchema, RestaurantServiceSchema, RestaurantHoursSchema],
      directory: dir.path,
      inspector: kReleaseMode ? false : true,
    );
  }

  // Fetch restaurants from Appwrite
  Future<List<Restaurant>> fetchRestaurantsFromAppwrite() async {
    try {
      final response = await database.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.restaurantCollectionId,
      );
      final restaurants = response.documents
          .map((doc) => Restaurant.fromMap(doc.data))
          .toList();

      // TODO: Save fetched data to cache

      return restaurants;
    } on AppwriteException catch (e) {
      Utils.logError(message: '[RestaurantAPI] fetch restaurants failed', error: e);
      return [];
    }
  }
  
  Future<void> getRestaurants({ required int searchKm }) async {
    Utils.logDebug(message: '[RestaurantAPI] Getting restaurants...');
    try {
      Position userPosition = await determinePosition();
      final boundingBox = calculateBoundingBox(position: userPosition, distanceKm: searchKm);
      final cells = calculateGridCells(
        minLat: boundingBox['minLat']!,
        maxLat: boundingBox['maxLat']!,
        minLong: boundingBox['minLong']!,
        maxLong: boundingBox['maxLong']!,
      );

    } catch (e) {
      Utils.logError(message: '[RestaurantAPI] getRestaurants failed', error: e);
    } finally {
      notifyListeners();
    }
  }

}