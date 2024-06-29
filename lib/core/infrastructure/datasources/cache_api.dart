import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/geocell.dart';
import 'package:onmangeou/core/domain/entities/price.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/domain/entities/restaurant_hours.dart';
import 'package:onmangeou/core/domain/entities/restaurant_service.dart';
import 'package:onmangeou/core/domain/entities/restaurant_types.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:path_provider/path_provider.dart';

class CacheAPI extends ChangeNotifier {
  bool isInitialized = false;
  late final Isar isar;

  //Constructor
  CacheAPI() {
    initIsar();
  }

  // Initialize Isar
  Future<void> initIsar() async {
    Utils.logDebug(message: '[CacheAPI] Initializing Isar...');
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [RestaurantSchema, PriceSchema, RestaurantTypesSchema, RestaurantServiceSchema, RestaurantHoursSchema, GeoCellSchema],
      directory: dir.path,
      inspector: kReleaseMode ? false : true,
    );
    isInitialized = true;
    Utils.logDebug(message: '[CacheAPI] Isar initialized');
    notifyListeners();
  }
  
  // Fetch cells from cache database
  Future<List<GeoCell?>> fetchCells({
    required List<Map<String, double>> cells,
  }) async {
    Utils.logDebug(message: '[CacheAPI] Fetching cells from cache...');
    return await isar.txn(() async {
      final futureResult = await Future.wait(cells.map((cell) async {
        final result = await isar.geoCells.where()
            .minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
              '${cell['minLat']},${cell['minLong']}',
              cell['maxLat'].toString(),
              cell['maxLong'].toString()
            ).findFirst();
        return result;
      }));
      return futureResult;
    });
  }

  // Fetch watched cells from cache database
  Future<List<GeoCell?>> fetchWatchedCellsWithLinks({required List<GeoCell> cells}) async {
    Utils.logDebug(message: '[CacheAPI] Fetching watched cells from cache...');
    return await isar.txn(() async {
      final futureResult = await Future.wait(cells.map((cell) async {
        final result = await isar.geoCells.where().minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
          '${cell.minLatitude},${cell.minLongitude}',
          cell.maxLatitude,
          cell.maxLongitude
        ).findFirst();

        // if (result != null) {
        //   result.restaurants.load();
        //   result.restaurants.forEach((restaurant) {
        //     restaurant.restaurantTypes.load();
        //     restaurant.restaurantService.load();
        //     restaurant.restaurantHours.load();
        //   });
        // }

        return result;
      }));
      return futureResult;
    });
  }

  // Fetch restaurant from cache database
  Restaurant? fetchRestaurantByDocumentIdSync({
    required String documentId,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Fetching restaurant from cache...');
    return isar.txnSync(() {
      return isar.restaurants.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Fetch price from cache database
  Price? fetchPriceByDocumentIdSync({
    required String documentId,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Fetching price from cache...');
    return isar.txnSync(() {
      return isar.prices.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Fetch restaurant hours from cache database
  RestaurantHours? fetchRestaurantHoursByDocumentIdSync({
    required String documentId,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Fetching restaurant hours from cache...');
    return isar.txnSync(() {
      return isar.restaurantHours.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Fetch restaurant service from cache database
  RestaurantService? fetchRestaurantServiceByDocumentIdSync({
    required String documentId,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Fetching restaurant service from cache...');
    return isar.txnSync(() {
      return isar.restaurantServices.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Fetch restaurant types from cache database
  RestaurantTypes? fetchRestaurantTypesByDocumentIdSync({
    required String documentId,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Fetching restaurant types from cache...');
    return isar.txnSync(() {
      return isar.restaurantTypes.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Write price to cache database
  void writePriceSync({
    required Price price,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Writing price to cache...');
    isar.writeTxnSync(() {
      isar.prices.putSync(price);
    });
  }

  // Write restaurant to cache database
  void writeRestaurant({
    required Restaurant restaurant,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Writing restaurant to cache...');
    isar.writeTxnSync(() {
      isar.restaurants.putSync(restaurant);
    });
  }

  // Write restaurantHours to cache database
  void writeRestaurantHoursSync({
    required RestaurantHours restaurantHours,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Writing restaurant hours to cache...');
    isar.writeTxnSync(() {
      isar.restaurantHours.putSync(restaurantHours);
    });
  }

  // Write restaurantService to cache database
  void writeRestaurantServiceSync({
    required RestaurantService restaurantService,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Writing restaurant service to cache...');
    isar.writeTxnSync(() {
      isar.restaurantServices.putSync(restaurantService);
    });
  }

  // Write restaurantTypes to cache database
  void writeRestaurantTypesSync({
    required RestaurantTypes restaurantTypes,
  }) {
    // Utils.logDebug(message: '[CacheAPI] Writing restaurant types to cache...');
    isar.writeTxnSync(() {
      isar.restaurantTypes.putSync(restaurantTypes);
    });
  }

  void cacheRestaurantsByCellsSync({
    required List<GeoCell> cells,
  }) {
    try {
      Utils.logDebug(message: '[CacheAPI] Caching restaurants by cells...');
      isar.writeTxnSync(() {
        isar.geoCells.putAllSync(cells);
      });
      Utils.logDebug(message: '[CacheAPI] Caching restaurants by cells successful');
    } catch (e) {
      Utils.logError(message: '[CacheAPI] Caching restaurants by cells failed', error: e);
    }
  }

  void resetCellRestaurantsLinks({
    required GeoCell cell,
  }) {
    try {
      isar.writeTxnSync(() {
        cell.restaurants.resetSync();
      });
    } on IsarError catch (_) {
      // Ignore isar error
      // Utils.logError(message: '[CacheAPI] resetCellRestaurantsLinks failed', error: e);
    }
  }

  void resetRestaurantLinks({
    required Restaurant restaurant,
  }) {
    try {
      isar.writeTxnSync(() {
        restaurant.restaurantTypes.resetSync();
        restaurant.restaurantService.resetSync();
        restaurant.restaurantHours.resetSync();
      });
    } on IsarError catch (_) {
      // Ignore isar error
      // Utils.logError(message: '[CacheAPI] resetRestaurantLinks failed', error: e);
    }
  }
}
