import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import 'route_handles.dart';

class Routes {
  /// 根目录
  static String root = "/";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
  }
}
