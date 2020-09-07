import 'package:fluro/fluro.dart' as fluro_router;
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

  static void configureRoutes(fluro_router.Router router) {
    router.notFoundHandler = fluro_router.Handler(
      handlerFunc: (_, parameters) => ErrorPage(),
    );
    router
      ..define(root, handler: rootHandler)
      ..define(main, handler: mainHandler)
      ..define(home, handler: homeHandler)
      ..define(menu, handler: menuHandler);
  }

  static void goMainPage(BuildContext context) {
    Application.router.navigateTo(
      context,
      Routes.main,
      clearStack: true,
      transition: fluro_router.TransitionType.fadeIn,
    );
  }
}
