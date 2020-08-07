import 'package:logger/logger.dart';

class Log {
  final bool isOut;

  const Log({this.isOut: true});

  void v(dynamic message) {
    if (isOut)
      Logger(
        printer: PrettyPrinter(methodCount: 8, colors: false, printTime: true),
      ).v(message);
  }

  void i(dynamic message) {
    if (isOut)
      Logger(
        printer: PrettyPrinter(methodCount: 0, colors: false, printTime: true),
      ).v(message);
  }

  void e(dynamic message) {
    if (isOut)
      Logger(
        printer: PrettyPrinter(colors: false, printTime: true),
      ).e(message);
  }

  void d(dynamic message) {
    if (isOut)
      Logger(
        printer: SimplePrinter(colors: false, printTime: true),
      ).d(message);
  }
}
