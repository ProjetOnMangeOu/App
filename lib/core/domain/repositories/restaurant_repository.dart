import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/geocell.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/infrastructure/datasources/restaurant_api.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';

abstract class RestaurantRepositoryClass extends ChangeNotifier {
  Future<void> search({ required int searchMeters });
}

class RestaurantRepository extends ChangeNotifier implements RestaurantRepositoryClass {
  late final RestaurantAPI restaurantAPI;
  late final CacheAPI cacheAPI;
  late List<GeoCell> watchedCells;
  late Stream<void> restaurantStream;

  // Constructor
  RestaurantRepository(this.restaurantAPI, this.cacheAPI) {
    watchedCells = [];
    init();
  }

  Future<void> init() async {
    Utils.logDebug(message: '[RestaurantRepository] Initializing...');
    await search(searchMeters: AppConstants.searchMeters);
    Utils.logDebug(message: '[RestaurantRepository] Initialized');
  }

  void initRestaurantStream() {
    restaurantStream = cacheAPI.isar.restaurants.watchLazy();
    restaurantStream.listen((_) {
      print('Restaurant stream event');
    });
  }

  @override
  Future<void> search({ required int searchMeters }) async {
    Utils.logDebug(message: '[RestaurantRepository] Searching restaurants...');
    try{
      // Get user's position
      Position userPosition = await determinePosition();

      // Calculate bounding box and grid cells
      final boundingBox = calculateBoundingBox(position: userPosition, distanceMeters: searchMeters);
      final cells = calculateGridCells(
        minLat: boundingBox['minLat']!,
        maxLat: boundingBox['maxLat']!,
        minLong: boundingBox['minLong']!,
        maxLong: boundingBox['maxLong']!,
      );

      // Fetch cells from cache
      final cachedCells = await cacheAPI.fetchCells(cells: cells);
      watchedCells.clear();
      watchedCells.addAll(cachedCells);
    } catch (e) {
      Utils.logError(message: '[RestaurantRepository] search failed', error: e);
    }
  }

  // TODO: Implement updateWatchedCells method

}
