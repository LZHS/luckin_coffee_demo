import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/data_provider/data_provider.dart';
import 'package:luckin_coffee_demo/models/models.dart';

import 'jpush_help.dart';

class Application {
  static FluroRouter router;

  static BuildContext context;

  static JPushHelp jPushHelp;


  /// 一些 初始化
  static void init() {
    Bloc.observer = SimpleBlocObserver();
    DatabaseManager();
    // jPushHelp=JPushHelp();
    
  }

}