import 'package:flutter/material.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/fluro/common.dart';
import 'package:flutter_demo/common/fluro/router.dart';
import 'package:flutter_demo/components/pages/login/login_page.dart';
import 'package:flutter_demo/components/pages/login/login_phone_page.dart';
import 'package:flutter_demo/components/pages/main/main_page.dart';
import 'package:flutter_demo/components/pages/main/order/evaluation/evaluation_page.dart';
import 'package:flutter_demo/components/pages/transition/transition_page.dart';
import 'package:flutter_demo/components/pages/wallet/coffee_wallet.dart';

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

///```
///咖啡钱包 页面
///```
var wallet = "/wallet/coffee_wallet";

var _wallet = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CoffeeWallet();
  },
);


///```
///用户登录， 选择登录方式页面
///```
var login = "/login/login_page";

var _login = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  },
);

///```
///手机验证码登录 页面
///```
var loginPhoneCode = "/login/login_phone_code";

var _loginPhoneCode = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPhonePage(isDeficiencyNum:params["isDeficiencyNum"]?.first);
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
      ..define(evaluation, handler: _evaluation)
      ..define(wallet, handler: _wallet)
      ..define(login, handler: _login)
      ..define(loginPhoneCode, handler: _loginPhoneCode)
      ;
  }
}
