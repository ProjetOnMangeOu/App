import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:onmangeou/core/domain/entities/restaurant.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';

class RestaurantAPI extends ChangeNotifier {
  Client client = Client();
  late final Databases database;

  // Constructor
  RestaurantAPI() {
    initClient();
  }

  // Initialize the client
  void initClient() {
    client
        .setEndpoint(AppWriteConstants.endpoint)
        .setProject(AppWriteConstants.projectId)
        .setSelfSigned(
        status: kReleaseMode
            ? false
            : true); // Self-signed certificate for development
    database = Databases(client);
  }

  // Fetch restaurants from Appwrite
  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      final response = await database.listDocuments(
        databaseId: 'your_database_id',
        collectionId: 'your_collection_id',
      );
      final restaurants = response.documents
          .map((doc) => Restaurant.fromMap(doc.data))
          .toList();

      return restaurants;
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Fetch restaurants failed', error: e);
      return [];
    }
  }

  // Method to get restaurants with caching logic
  Future<List<Restaurant>> getRestaurants() async {
    return await fetchRestaurants();
  }
}
