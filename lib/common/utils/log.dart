import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static final Log _instance = Log._internal();
  Logger _logger;
  factory Log( ) => _instance;

  Log._internal() {
    _logger ??= Logger(printer: SimplePrinter(printTime: true, colors: false));
  }

  void v(dynamic message) {
    if (kDebugMode) _logger.v(message);
  }

  void i(dynamic message) {
    if (kDebugMode) _logger.v(message);
  }

  void e(dynamic message) {
    Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    ).e(message);
  }

  void d(dynamic message) {
    if (kDebugMode)
      _logger.d(message);
  }
}
