import 'package:logger/logger.dart';

class Log {
  final bool isOut;

  Log({this.isOut: true});

  void v(dynamic message) {
    if (isOut)
      Logger(
        printer: PrettyPrinter(colors: false, printTime: true),
      ).v(message);
  }

  void e(dynamic message) {
      Logger(
        printer: PrettyPrinter( printTime: true),
      ).e(message);
  }

  void d(dynamic message) {
    if (isOut)
      Logger(
        printer: SimplePrinter(colors: false, printTime: true),
      ).d(message);
  }
}
