import 'dart:developer';

class Utils {
  static logDebug({required dynamic message, Object? error}) {
    log(message.toString(),
        time: DateTime.now(), name: 'DEBUG', level: 700, error: error);
  }

  static logError({required dynamic message, Object? error}) {
    log(message.toString(),
        time: DateTime.now(), name: 'ERROR', level: 1000, error: error);
  }
}
