import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/foundation.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthAPI extends ChangeNotifier {
  Client client = Client();
  late final Account account;

  late models.User _currentUser;
  AuthStatus _status = AuthStatus.unknown;

  // Getter methods
  models.User get currentUser => _currentUser;
  AuthStatus get status => _status;

  // Constructor
  AuthAPI() {
    initClient();
    loadCurrentUser();
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
    account = Account(client);
  }

  // Methods
  Future<void> loadCurrentUser() async {
    try {
      Utils.logDebug(message: 'Loading current user');
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
    } on AppwriteException catch (e) {
      _status = AuthStatus.unauthenticated;
      if (e.code != 401) {
        Utils.logError(message: 'Load current user failed', error: e);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Map<String, Object>> registerAccount(
      {required String email,
      required String password,
      required String username}) async {
    try {
      await account.create(
          userId: ID.unique(),
          email: email,
          password: password,
          name: username);
      await loginWithPass(email: email, password: password);
      await sendEmailVerification(url: AppWriteConstants.emailVerificationUrl);
      return {
        'success': true,
      };

    } on AppwriteException catch (e) {
      Utils.logError(message: 'Register failed', error: e);
      return {
        'success': false,
        'error': e,
      };
    }
  }

  Future<void> sendEmailVerification({required String url}) async {
    try {
      await account.createVerification(url: url);
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Send email verification failed', error: e);
    }
  }

  Future<void> confirmEmailVerification({required String userId, required String secret}) async {
    try {
      await account.updateVerification(userId: userId, secret: secret);
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Email verification failed', error: e);
    }
  }

  Future<void> loginWithPass(
      {required String email, required String password}) async {
    try {
      await account.createEmailSession(
          email: email, password: password);
      await loadCurrentUser();
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Login failed', error: e);
    }
  }

  Future<Map<String, Object>> requestPasswordReset({
    required String email,
    required String url,
  }) async {
    try {
      await account.createRecovery(email: email, url: url);
      return {
        'success': true,
      };
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Request password reset failed', error: e);
      return {
        'success': false,
        'error': e,
      };
    }
  }

  Future<Map<String, Object>> confirmPasswordReset({
    required String userId,
    required String secret,
    required String password,
    required String passwordAgain,
  }) async {
    try {
      await account.updateRecovery(
          userId: userId, secret: secret, password: password, passwordAgain: passwordAgain);
      return {
        'success': true,
      };
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Confirm password reset failed', error: e);
      return {
        'success': false,
        'error': e,
      };
    }
  }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      _status = AuthStatus.unauthenticated;
    } on AppwriteException catch (e) {
      Utils.logError(message: 'Logout failed', error: e);
    } finally {
      notifyListeners();
    }
  }
}
