import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/common/fluro/router.dart';
import 'package:flutter_demo/components/transition/transition_page.dart';

var root = "/";
var _rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TransitionPage();
});

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      Log.d("未找到 该页面 ", tag: "Routes");
    });
    router.define(root, handler: _rootHandler);
  }
}
