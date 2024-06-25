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
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:path_provider/path_provider.dart';

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
    required List<Map<String, double>> cells,
  }) async {
    try {

      final restaurantsPerCell = await Future.wait(cells.map((cell) async {
        final response = await database.listDocuments(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.restaurantCollectionId,
            queries: [
              Query.lessThanEqual('lat', cell['maxLat']),
              Query.greaterThanEqual('lat', cell['minLat']),
              Query.lessThanEqual('long', cell['maxLong']),
              Query.greaterThanEqual('long', cell['minLong']),
            ]
        );
        return response.documents
            .map((doc) => Restaurant.fromMap(doc.data, isar))
            .toList();
      }));


      // Cache the cell with the restaurants asynchrounously
      cacheCellsWithRestaurants(cells: cells.toList(), restaurantsPerCell: restaurantsPerCell);

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

      final cellsToUpdate = cells.map((cell) {

        return isar.txnSync(() {
          final cellInCache = isar.geoCells.where()
              .minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
              '${cell['minLat']},${cell['minLong']}',
              cell['maxLat'].toString(),
              cell['maxLong'].toString()
          ).findFirstSync();

          if(cellInCache != null && cellInCache.expirationDate.isAfter(DateTime.now())) {
            final restaurantsInCell = cellInCache.restaurants.toList();
            restaurants.addAll(restaurantsInCell);
            // TODO: restaurants.addAll(cellInCache.restaurants);
            return {};
          } else {
            return cell;
          }
        });

      }).where((element) => element.isNotEmpty).cast<Map<String, double>>().toList();

      if(cellsToUpdate.isNotEmpty) {
        // Fetch restaurants from Appwrite
        final restaurantsFromAppwrite = await fetchRestaurantsFromAppwrite(cells: cellsToUpdate);
        restaurants.addAll(restaurantsFromAppwrite);
      }

    } catch (e) {
      Utils.logError(message: '[RestaurantAPI] getRestaurants failed', error: e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> cacheCellsWithRestaurants ({
    required List<Map<String, double>> cells,
    required List<List<Restaurant>> restaurantsPerCell
  }) async {
    try {
      print('cacheCellsWithRestaurants txn');
      await isar.writeTxn(() async {
        for (var i = 0; i < cells.length; i++) {
          var cell = cells[i];
          var restaurants = restaurantsPerCell[i];
          final existingCell = await isar.geoCells.where()
              .minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
              '${cell['minLat']},${cell['minLong']}',
              cell['maxLat'].toString(),
              cell['maxLong'].toString()
          ).findFirst();

          if(existingCell != null) {
            // If the cell exists, update the existing restaurants and add new ones and update expiration date
            print('isar id ${restaurants[0].id}');
          } else {
            // If the cell does not exist, create a new cell and add it to the database
            final newCell = GeoCell(
              minLatitude: cell['minLat'].toString(),
              maxLatitude: cell['maxLat'].toString(),
              minLongitude: cell['minLong'].toString(),
              maxLongitude: cell['maxLong'].toString(),
            );
            newCell.restaurants.addAll(restaurants);
            newCell.expirationDate = DateTime.now().add(AppConstants.cacheExpirationTime);
            isar.geoCells.put(newCell);
          }
        }
      });
    } catch (e) {
      Utils.logError(message: '[RestaurantAPI] cacheCellsWithRestaurants failed', error: e);
    }
  }

}