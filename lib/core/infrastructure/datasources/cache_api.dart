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
  Future<List<GeoCell>> fetchCells({
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
      return futureResult.where((cell) => cell != null).cast<GeoCell>().toList();
    });
  }

  // Fetch price from cache database
  Price? fetchPriceByDocumentIdSync({
    required String documentId,
  }) {
    Utils.logDebug(message: '[CacheAPI] Fetching price from cache...');
    return isar.txnSync(() {
      return isar.prices.where().documentIdEqualTo(documentId).findFirstSync();
    });
  }

  // Write price to cache database
  void writePriceSync({
    required Price price,
  }) {
    Utils.logDebug(message: '[CacheAPI] Writing price to cache...');
    isar.writeTxnSync(() {
      isar.prices.putSync(price);
    });
  }

  Future<void> cacheRestaurantsByCells({
    required Map<
        Map<String, double>,
        List<Restaurant>
    > cells,
  }) async {
    try {
      Utils.logDebug(message: '[CacheAPI] Caching restaurants by cells...');
      await isar.writeTxn(() async {
        for(var i = 0; i < cells.length; i++) {
          final cell = cells.keys.elementAt(i);
          final restaurants = cells.values.elementAt(i);
          final cellInCache = await isar.geoCells.where()
              .minCoordinatesMaxLatitudeMaxLongitudeEqualTo(
              '${cell['minLat']},${cell['minLong']}',
              cell['maxLat'].toString(),
              cell['maxLong'].toString()
          ).findFirst();

          if(cellInCache != null) {
            // If the cell exists, update the existing restaurants and add new ones and update expiration date on the cell
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
      Utils.logError(message: '[CacheAPI] cacheRestaurantsByCells failed', error: e);
    }
  }
}
