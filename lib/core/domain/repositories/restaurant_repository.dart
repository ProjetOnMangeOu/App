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
  Future<void> updateSearchMeters(int meters);
  Future<void> search();
  Future<void> updateWatchedCells();
  Future<void> queryWatchedCells();
}

class RestaurantRepository extends ChangeNotifier
    implements RestaurantRepositoryClass {
  bool isInitialized = false;
  var searchMeters = AppConstants.searchMeters;
  late final RestaurantAPI restaurantAPI;
  late final CacheAPI cacheAPI;
  late List<GeoCell> watchedCells;
  late Stream<void> watchedCellsStream;

  // Constructor
  RestaurantRepository(this.restaurantAPI, this.cacheAPI) {
    watchedCells = [];
    init();
  }

  Future<void> init() async {
    Utils.logDebug(message: '[RestaurantRepository] Initializing...');
    await search();
    initWatchedCellsStream();
    isInitialized = true;
    Utils.logDebug(message: '[RestaurantRepository] Initialized');
  }

  void initWatchedCellsStream() {
    watchedCellsStream = cacheAPI.isar.geoCells.watchLazy();
    watchedCellsStream.listen((_) {
      Utils.logDebug(message: '[RestaurantRepository] Cell stream updated');
      queryWatchedCells();
    });
  }

  @override
  Future<void> search() async {
    Utils.logDebug(message: '[RestaurantRepository] Searching restaurants...');
    try {
      // Get user's position
      Position userPosition = await determinePosition();

      // Calculate bounding box and grid cells
      final boundingBox = calculateBoundingBox(
          position: userPosition, distanceMeters: searchMeters);
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
      Utils.logDebug(message: '[RestaurantRepository] Searched restaurants');
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
      final cellsToUpdate = await Future.wait(watchedCells.map((cell) async {
        // Check if cell is expired
        if (cell.expirationDate.isAfter(DateTime.now())) return null;
        cell.expirationDate =
            DateTime.now().add(AppConstants.cacheExpirationTime);
        // Fetch restaurants from Appwrite
        final restaurants =
            await restaurantAPI.fetchRestaurantsByCell(cell: cell);
        final toAddRestaurants = restaurants
            .map((restaurant) => Restaurant.fromMap(restaurant, cacheAPI))
            .toList();
        cell.restaurants.clear();
        cacheAPI.resetCellRestaurantsLinks(cell: cell);
        cell.restaurants.addAll(toAddRestaurants);
        return cell;
      }));

      // Cache restaurants by cells
      cacheAPI.cacheRestaurantsByCellsSync(
          cells: cellsToUpdate
              .where((cell) => cell != null)
              .toList()
              .cast<GeoCell>());
      Utils.logDebug(message: '[RestaurantRepository] Updated watched cells');
    } catch (e) {
      Utils.logError(
          message: '[RestaurantRepository] updateWatchedCells failed',
          error: e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<void> queryWatchedCells() async {
    Utils.logDebug(message: '[RestaurantRepository] Querying watched cells...');
    try {
      final cellsResult = await cacheAPI.fetchWatchedCells(cells: watchedCells);
      watchedCells =
          cellsResult.where((cell) => cell != null).toList().cast<GeoCell>();
      Utils.logDebug(message: '[RestaurantRepository] Queried watched cells');
    } catch (e) {
      Utils.logError(
          message: '[RestaurantRepository] queryWatchedCells failed', error: e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<void> updateSearchMeters(int meters) {
    searchMeters = meters;
    return search();
  }
}
