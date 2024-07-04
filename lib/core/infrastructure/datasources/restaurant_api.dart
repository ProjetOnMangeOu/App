import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:onmangeou/core/domain/entities/geocell.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';

class RestaurantAPI extends ChangeNotifier {
  Client client = Client();
  bool isInitialized = false;
  late final Databases database;

  // Constructor
  RestaurantAPI() {
    initClient();
  }

  // Initialize the Appwrite client
  void initClient() {
    Utils.logDebug(message: '[RestaurantAPI] Initializing client...');
    client
        .setEndpoint(AppWriteConstants.endpoint)
        .setProject(AppWriteConstants.projectId)
        .setSelfSigned(status: kReleaseMode ? false : true);
    database = Databases(client);
    isInitialized = true;
    Utils.logDebug(message: '[RestaurantAPI] Client initialized');
    notifyListeners();
  }

  // Fetch restaurants from Appwrite
  Future<List<Map<String, dynamic>>> fetchRestaurantsByCell({
    required GeoCell cell,
  }) async {
    List<Map<String, dynamic>> allDocuments = [];
    String? nextCursor;

    try {
      Utils.logDebug(
          message: '[RestaurantAPI] Fetching restaurants by cell...');

      do {
        List<String> queries = [
          Query.lessThanEqual('lat', double.parse(cell.maxLatitude)),
          Query.greaterThanEqual('lat', double.parse(cell.minLatitude)),
          Query.lessThanEqual('long', double.parse(cell.maxLongitude)),
          Query.greaterThanEqual('long', double.parse(cell.minLongitude)),
        ];

        if (nextCursor != null) {
          queries.add(Query.cursorAfter(nextCursor));
        }

        final response = await database.listDocuments(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.restaurantCollectionId,
          queries: queries,
        );

        allDocuments.addAll(response.documents.map((doc) => doc.data).toList());

        // Update the cursor for the next batch
        if (response.documents.isNotEmpty) {
          nextCursor = response.documents.last.$id;
        } else {
          nextCursor = null;
        }
      } while (nextCursor != null);
      return allDocuments;
    } on AppwriteException catch (e) {
      Utils.logError(
          message: '[RestaurantAPI] fetch restaurants failed', error: e);
      return [];
    }
  }
}
