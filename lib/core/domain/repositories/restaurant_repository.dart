import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onmangeou/core/domain/entities/geocell.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/infrastructure/datasources/restaurant_api.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';

abstract class RestaurantRepositoryClass extends ChangeNotifier {
  Future<void> search();
  Future<void> updateWatchedCells();
}

class RestaurantRepository extends ChangeNotifier implements RestaurantRepositoryClass {
  var searchMeters = AppConstants.searchMeters;
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
    await search();
    initRestaurantStream();
    Utils.logDebug(message: '[RestaurantRepository] Initialized');
  }

  void initRestaurantStream() {
    restaurantStream = cacheAPI.isar.restaurants.watchLazy();
    restaurantStream.listen((_) {
      Utils.logDebug(message: '[RestaurantRepository] Restaurant stream updated');
      // TODO: Implement a way to update watchedCells when a restaurant is updated
    });
  }

  @override
  Future<void> search() async {
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

      // Clear watched cells
      watchedCells.clear();

      // Check if a cached geocell is null in the list
      // If it is, create a new geocell
      cells.asMap().forEach((index, cell) {
        if (cachedCells[index] == null) {
          final newCell = GeoCell(
            minLatitude: cell['minLat'].toString(),
            maxLatitude: cell['maxLat'].toString(),
            minLongitude: cell['minLong'].toString(),
            maxLongitude: cell['maxLong'].toString(),
          );
          watchedCells.add(newCell);
        } else {
          watchedCells.add(cachedCells[index]!);
        }
      });

      // Trigger updateWatchedCells
      updateWatchedCells();

    } catch (e) {
      Utils.logError(message: '[RestaurantRepository] search failed', error: e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<void> updateWatchedCells() async {
    Utils.logDebug(message: '[RestaurantRepository] Updating watched cells...');
    try {
      final cells = await Future.wait(watchedCells.map((cell) async {
        // Fetch restaurants from Appwrite
        final restaurants = await restaurantAPI.fetchRestaurantsByCell(cell: cell);
        final toAddRestaurants = restaurants.map((restaurant) => Restaurant.fromMap(restaurant, cacheAPI)).toList();
        cell.restaurants.clear();
        cell.restaurants.addAll(toAddRestaurants);
        return cell;
      }));

      // Cache restaurants by cells
      cacheAPI.cacheRestaurantsByCells(cells: cells);
    } catch (e) {
      Utils.logError(message: '[RestaurantRepository] updateWatchedCells failed', error: e);
    } finally {
      notifyListeners();
    }
  }

}
