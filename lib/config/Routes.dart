import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/common/fluro/router.dart';
import 'package:flutter_demo/components/pages/main/main_page.dart';
import 'package:flutter_demo/components/pages/main/order/evaluation/evaluation_page.dart';
import 'package:flutter_demo/components/pages/transition/transition_page.dart';

///```
/// 根页面 --- 用于 过度 页面
/// ```
var root = "/";
var _rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TransitionPage();
  },
);

///```
/// 主页面
/// ```
var home = "/main/main_page";
var _homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage(msg: params["message"]?.first);
  },
);

///```
///订单评价页面
///```
var evaluation = "/main/order/evaluation/evaluation_page";

var _evaluation = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return EvaluationPage(orderId: params["orderId"]?.first);
  },
);

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        Log.d("未找到 该页面 ", tag: "Routes");
        return;
      },
    );
    router
      ..define(root, handler: _rootHandler)
      ..define(home, handler: _homeHandler)
      ..define(evaluation, handler: _evaluation);
  }
}
