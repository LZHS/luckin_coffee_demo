import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:luckin_coffee_demo/components/components.dart';
/// 根页面 -- 应用闪屏页面
var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // return ProgressTest();
  return TransitionsPage();
});

/// 主页面
var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MainPage();
    });

/// 首页---页面
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomePage();
    });

/// 菜单页面
var menuHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MenuPage();
    });
/// 菜单页面
var scanHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ScanPage();
});

/// 用戶选择 登录方式 页面
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

/// 微信 登录 页面
var weChatLoginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WechatLoginPage();
    });
/// 手机号  登录 页面
var phoneLoginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PhoneNumLoginPage();
    });/// 手机号  登录 页面
var phoneAreaHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PhoneAreaPage();
    });
