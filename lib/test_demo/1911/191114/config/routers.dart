 
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/fluro/src/common.dart';
import 'package:flutter_demo/fluro/src/router.dart';
import 'package:flutter_demo/test_demo/1911/191114/components/pages/demo/demo_message_component.dart';
import 'package:flutter_demo/test_demo/1911/191114/components/pages/home/home_component.dart';
import 'package:flutter_demo/test_demo/1911/191114/config/application.dart';

final String root = "/";

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent();
});

final String messagePage = "/message";

var messagePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  Log.d("messagePageHandler $params");
  String message = params["message"].first;
  return DemoMessageComponent(message: message);
});

class Routers {
  static void configureRouters(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      Log.e("找不到页面！！！");
    });
    router
      ..define(root, handler: rootHandler)
      ..define(messagePage, handler: messagePageHandler);
  }
}

class RouterManager {
  static Future goDemoMessageComponent(BuildContext context, String message,
      {Color color}) {
   return Application.router
    .navigateTo(
        context, 
        messagePage + "?message=$message",
        transition: TransitionType.inFromLeft) 
        ;
  }
}
