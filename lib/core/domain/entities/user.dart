import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/foundation.dart';
import 'package:onmangeou/shared/utils.dart';

class User extends ChangeNotifier {
  late models.User _user;
  late bool _isVerified;
  late String _username;
  late String _id;

  //Getters
  models.User get user => _user;
  String get username => _username;
  String get id => _id;
  bool get isVerified => _isVerified;

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
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Init user failed', error: e);
    } finally {
      notifyListeners();
    }
  }
}
