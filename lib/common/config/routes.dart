import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/common/common.dart';
import 'package:luckin_coffee_demo/components/error/error_page.dart';

import 'route_handles.dart';

class Routes {
  /// 根目录
  static String root = "/";

  /// 应用页面
  static String main = "/main/main_page";

  ///  首页 页面
  static String home = "/home/home_page";

  /// 菜单页面
  static String menu = "/menu/menu_page";

  /// 扫描页面
  static String scan = "/home/scan/scan_page";

  /// 用户选择登陆页面
  static String login = "/login/login_page";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (_, parameters) => ErrorPage(),
    );
    router
      ..define(root, handler: rootHandler)
      ..define(main, handler: mainHandler)
      ..define(home, handler: homeHandler)
      ..define(menu, handler: menuHandler)
      ..define(scan, handler: scanHandler)
      ..define(login, handler: loginHandler);
  }

  static void goMainPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.main,
      clearStack: true,
      transition: TransitionType.fadeIn,
    );
  }
  static void goScanPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.scan,
      transition: TransitionType.fadeIn,
    );
  }static void goLoginPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.login,
      transition: TransitionType.fadeIn,
    );
  }
}
