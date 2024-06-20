import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart' as Isar;
import 'package:onmangeou/core/domain/entities/geocell.dart';
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
  bool isarInitialized = false;
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
      [RestaurantSchema, PriceSchema, RestaurantTypesSchema, RestaurantServiceSchema, RestaurantHoursSchema, GeoCellSchema],
      directory: dir.path,
      inspector: kReleaseMode ? false : true,
    );
    isarInitialized = true;
    Utils.logDebug(message: '[RestaurantAPI] Isar initialized');
  }

  // Fetch restaurants from Appwrite
  Future<List<Restaurant>> fetchRestaurantsFromAppwrite({
    required double minLat,
    required double maxLat,
    required double minLong,
    required double maxLong
  }) async {
    try {
      final response = await database.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.restaurantCollectionId,
        queries: [
          Query.lessThanEqual('lat', maxLat),
          Query.greaterThanEqual('lat', minLat),
          Query.lessThanEqual('long', maxLong),
          Query.greaterThanEqual('long', minLong),
        ]
      );
      final restaurants = response.documents
          .map((doc) => Restaurant.fromMap(doc.data))
          .toList();

      // Cache the cell with the restaurants
      await cacheCellWithRestaurants(
        minLat: minLat,
        maxLat: maxLat,
        minLong: minLong,
        maxLong: maxLong,
        restaurants: restaurants,
      );

      return restaurants;
    } on AppwriteException catch (e) {
      Utils.logError(message: '[RestaurantAPI] fetch restaurants failed', error: e);
      return [];
    }
  }

  // Get restaurants from Isar or Appwrite
  Future<void> getRestaurants({ required int searchKm }) async {
    Utils.logDebug(message: '[RestaurantAPI] Getting restaurants...');
    try {
      // Get user's position
      Position userPosition = await determinePosition();

      // Calculate bounding box and grid cells
      final boundingBox = calculateBoundingBox(position: userPosition, distanceKm: searchKm);
      final cells = calculateGridCells(
        minLat: boundingBox['minLat']!,
        maxLat: boundingBox['maxLat']!,
        minLong: boundingBox['minLong']!,
        maxLong: boundingBox['maxLong']!,
      );

      Utils.logDebug(message: '[RestaurantAPI] Cells: $cells');

      // Fetch restaurants from Appwrite
      for(var cell in cells) {

        // If the cell is already in cache, fetch from cache
        final cellsInCache = await isar.geoCells.where()
          .maxLongitudeCompositeMinLatitudeMaxLatitudeMinLongitudeEqualTo(
            cell['maxLong'].toString(),
            cell['minLat'].toString(),
            cell['maxLat'].toString(),
            cell['minLong'].toString(),
          ).findFirst();

        if(cellsInCache != null) {
          // If the cell is in cache, fetch from cache
          final restaurantsInCell = cellsInCache.restaurants.toList();
          restaurants.addAll(restaurantsInCell);
          continue;
        } else {
          // Otherwise, fetch from Appwrite
          final fetchedRestaurants = await fetchRestaurantsFromAppwrite(
            minLat: cell['minLat']!,
            maxLat: cell['maxLat']!,
            minLong: cell['minLong']!,
            maxLong: cell['maxLong']!,
          );
          restaurants.addAll(fetchedRestaurants);
        }
      }

    } catch (e) {
      Utils.logError(message: '[RestaurantAPI] getRestaurants failed', error: e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> cacheCellWithRestaurants ({
    required double minLat,
    required double maxLat,
    required double minLong,
    required double maxLong,
    required List<Restaurant> restaurants
  }) async {
    try {
      final cell = GeoCell(
        minLatitude: minLat.toString(),
        maxLatitude: maxLat.toString(),
        minLongitude: minLong.toString(),
        maxLongitude: maxLong.toString(),
      );
      cell.restaurants.addAll(restaurants);

      await isar.writeTxn(() async {
        await isar.geoCells.put(cell);
      });
    } catch (e) {
      Utils.logError(message: '[RestaurantAPI] cacheCellWithRestaurants failed', error: e);
    }
  }

}