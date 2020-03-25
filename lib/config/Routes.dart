import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/fluro/router.dart';
import 'package:luckin_coffee_demo/components/pages/login/choose_area_page.dart';
import 'package:luckin_coffee_demo/components/pages/login/login_page.dart';
import 'package:luckin_coffee_demo/components/pages/login/login_phone_page.dart';
import 'package:luckin_coffee_demo/components/pages/login/terms_of_service.dart';
import 'package:luckin_coffee_demo/components/pages/main/main_page.dart';
import 'package:luckin_coffee_demo/components/pages/main/order/evaluation/evaluation_page.dart';
import 'package:luckin_coffee_demo/components/pages/transition/transition_page.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/coffee_wallet.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/coffee_wallet_info.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/privilege/privilege_all_page.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/privilege/privilege_page.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/recharge/recharge_page.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/specification/service_regulations_page.dart';
import 'package:luckin_coffee_demo/test_demo/animated_list_sample.dart';

///```
/// 根页面 --- 用于 过度 页面
/// ```
var root = "/";
var _rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RechargePage();
    /*
         AnimatedListSample
        TransitionPage();

     */

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
///咖啡钱包详情 页面
///```
var walletInfo = "/wallet/coffee_wallet_info";
var _walletInfo = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return CoffeeWalletInfo(params["itemBean"]?.first);
  },
);

///```
///咖啡钱包 使用规则 页面
///```
var serviceRegulationsPage = "/wallet/specification/service_regulations_page";
var _serviceRegulationsPage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ServiceRegulationsPage();
  },
);

///```
/// 充值咖啡钱包 页面
///```
var rechargePage = "wallet/recharge/recharge_page";
var _rechargePage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RechargePage();
  },
);

///```
/// 优惠活动页面
///```
var privilegePage = "wallet/privilege/privilege_page";
var _privilegePage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PrivilegePage();
  },
);

///```
/// 全部优惠 页面
///```
var privilegeAllPage = "wallet/privilege/privilege_all_page";
var _privilegeAllPage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return PrivilegeAllPage();
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
    return LoginPhonePage(isDeficiencyNum: params["isDeficiencyNum"]?.first);
  },
);

///```
///选择国家/地区
///```
var chooseAreaPage = "/login/choose_area_page";
var _chooseAreaPage = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ChooseAreaPage();
  },
);

///```
///用户协议
///```
var termsOfService = "/login/terms_of_service";
var _termsOfService = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return TermsOfService();
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
      ..define(walletInfo, handler: _walletInfo)
      ..define(serviceRegulationsPage, handler: _serviceRegulationsPage)
      ..define(rechargePage, handler: _rechargePage)
      ..define(privilegePage, handler: _privilegePage)
      ..define(privilegeAllPage, handler: _privilegeAllPage)
      ..define(login, handler: _login)
      ..define(loginPhoneCode, handler: _loginPhoneCode)
      ..define(chooseAreaPage, handler: _chooseAreaPage)
      ..define(termsOfService, handler: _termsOfService);
  }
}
