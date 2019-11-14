import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/test_demo/1911/191114/components/pages/home/home_component.dart';

final String root = "/";
var rootHandler=Handler(handlerFunc:(BuildContext context, Map<String, List<String>> params){ return HomeComponent();} );

class Routers {
  static void configureRouters(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      Log.e("找不到页面！！！");
    });
    router.define( root,handler: rootHandler);
  }
}
