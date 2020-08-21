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
    if (kDebugMode)
      _logger.e(message);
  }

  void d(dynamic message) {
    if (kDebugMode)
      _logger.d(message);
  }
}
