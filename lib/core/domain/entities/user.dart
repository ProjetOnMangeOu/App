import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:onmangeou/shared/geolocator.dart';
import 'package:onmangeou/shared/utils.dart';

class User extends ChangeNotifier {
  late models.User _user;
  late bool _isVerified;
  late String _username;
  late String _id;
  late String _email;
  late Position? _position;

  //Getters
  models.User get user => _user;
  String get username => _username;
  String get id => _id;
  String get email => _email;
  bool get isVerified => _isVerified;
  Position? get position => _position;

  //Constructor
  User({required models.User user}) {
    _user = user;
    initUser(user: user);
  }

  //Methods
  void initUser({required models.User user}) {
    try {
      _id = user.$id;
      _username = user.name;
      _isVerified = user.emailVerification;
      _email = user.email;

      updatePosition();
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Init user failed', error: e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> updatePosition() async {
    try{
      Utils.logDebug(message: 'Updating position...');
      // Get user's position
      Position userPosition = await determinePosition();
      _position = userPosition;
    } catch (e) {
      Utils.logError(message: 'Update position failed', error: e);
    } finally {
      notifyListeners();
    }
  }
}
