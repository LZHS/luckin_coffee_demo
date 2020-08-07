import 'package:fluro/fluro.dart';
import 'package:luckin_coffee_demo/models/models.dart';

class Application {
  static Router router;

  /// 一些 初始化
  static void init() {
    Bloc.observer = SimpleBlocObserver();
  }
}