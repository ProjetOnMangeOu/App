import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:onmangeou/core/domain/entities/metadata.dart';
import 'package:onmangeou/core/domain/entities/price.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/core/domain/entities/restaurant_hours.dart';
import 'package:onmangeou/core/domain/entities/restaurant_service.dart';
import 'package:onmangeou/core/domain/entities/restaurant_type.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:path_provider/path_provider.dart';

class RestaurantAPI extends ChangeNotifier {
  Client client = Client();
  late final Databases database;
  late final Isar isar;

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
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [RestaurantSchema, PriceSchema, RestaurantTypeSchema, RestaurantServiceSchema, RestaurantHoursSchema, MetadataSchema],
      directory: dir.path,
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

      // Save fetched data to cache
      await saveRestaurantsToCache(restaurants);

      return restaurants;
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Fetch restaurants failed', error: e);
      return [];
    }
  }

  // Method to get restaurants with caching logic
  Future<List<Restaurant>> getRestaurants() async {
    // Check if the cache is valid
    if (await isCacheValid()) {
      // Return cached data if valid
      final cachedRestaurants = await fetchRestaurantsFromCache();
      if (cachedRestaurants.isNotEmpty) {
        return cachedRestaurants;
      }
    }
    // Fetch from Appwrite if cache is invalid or empty
    return await fetchRestaurantsFromAppwrite();
  }

  // Check if cache is valid based on the expiration duration
  Future<bool> isCacheValid() async {
    final lastUpdated = await getLastUpdatedTime();
    if (lastUpdated == null) return false;
    final now = DateTime.now();
    return now.difference(lastUpdated) < AppConstants.cacheExpirationTime;
  }

  // Fetch restaurants from Isar cache
  Future<List<Restaurant>> fetchRestaurantsFromCache() async {
    return await isar.restaurants.where().findAll();
  }

  // Save fetched restaurants to Isar cache
  Future<void> saveRestaurantsToCache(List<Restaurant> restaurants) async {
    await isar.writeTxn(() async {
      await isar.restaurants.clear();
      await isar.restaurants.putAll(restaurants);
      await putLastUpdatedTime(DateTime.now());
    });
  }

  // Fetch last updated time from Metadata collection
  Future<DateTime?> getLastUpdatedTime() async {
    final meta = await isar.metadatas.where().findFirst();
    return meta?.lastUpdated;
  }

  // Save last updated time to Metadata collection
  Future<void> putLastUpdatedTime(DateTime time) async {
    final meta = Metadata()..lastUpdated = time;
    await isar.writeTxn(() async {
      await isar.metadatas.put(meta);
    });
  }
}