import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

const bool kReleaseMode =
    bool.fromEnvironment('dart.vm.product', defaultValue: false);

///```
/// 日志工具类
///```
class Log {
  static const String _TAG_DEF = "### flutter - log ###";

  static bool debuggable = !kReleaseMode; //是否是debug模式,true: log v 不输出.

  static void init({bool isDebug = false}) {
    debuggable = isDebug;
  }

  static void e(Object object, {String tag = _TAG_DEF}) {
    _printLog(tag, '  E   ', object);
  }

  static void v(Object object, {String tag = _TAG_DEF}) {
    if (debuggable) _printLog(tag, '  V   ', object);
  }

  static void d(Object object, {String tag = _TAG_DEF}) {
    if (debuggable) _printLog(tag, '  D   ', object);
  }

  static void _printLog(String tag, String stag, Object object) {
    String da = object.toString();
    while (da.isNotEmpty) {
      da = "  " +
          ((tag == null || tag.isEmpty) ? _TAG_DEF : tag) +
          "  " +
          DateTime.now().toString() +
          "  " +
          stag +
          da;
      if (da.length > 512) {
        print(da.substring(0, 512) + "\n");
        da = da.substring(512, da.length);
      } else {
        print(da + "\n");
        da = "";
      }
    }
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

/// 获取当前的state
NavigatorState getCurrentState() => navigatorKey.currentState;

/// 获取当前的context
BuildContext getCurrentContext() => navigatorKey.currentContext;

/// 获取屏幕上下边距
/// 用于兼容全面屏，刘海屏
EdgeInsets screenPadding() => MediaQuery.of(getCurrentContext()).padding;

/// 获取屏幕宽度
double screenWidth() => MediaQuery.of(getCurrentContext()).size.width;

/// 获取屏幕高度
double screenHeight() => MediaQuery.of(getCurrentContext()).size.height;

///```
/// 简单封装 Toast
///```
void showToast(
  String msg, {
  Toast toastLength = Toast.LENGTH_SHORT,
  int timeInSecForIos = 1,
  double fontSize = 16.0,
  ToastGravity gravity = ToastGravity.BOTTOM,
  Color backgroundColor = toastTextColor,
  Color textColor = Colors.white,
  // Function(bool) didTap,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    timeInSecForIos: timeInSecForIos,
    fontSize: fontSize,
    gravity: gravity,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}

/// 校验工具类
class ValidatorUtil {
  ///正则表达式：验证用户名
//  final RegExp REGEX_USERNAME = RegExp(r"^[a-zA-Z]\\w{5,20}");

  ///正则表达式：验证密码
//  final RegExp REGEX_PASSWORD = RegExp(r"^[a-zA-Z0-9]{6,20}$");


  ///正则表达式：验证邮箱
  //final RegExp REGEX_EMAIL = RegExp(
  // r"^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");

  ///正则表达式：验证汉字
  //final RegExp REGEX_CHINESE = RegExp(r"^[\u4e00-\u9fa5],{0,}$");

  /// 正则表达式：验证身份证
  // final RegExp REGEX_ID_CARD = RegExp(r"(^\\d{18}$)|(^\\d{15}$)");


  ///正则表达式：验证IP地址
  static bool isIpAddr(String ip) {
    return RegExp(r"(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)").hasMatch(ip);
  }

  ///手机号验证
  static bool isChinaPhoneLegal(String phone) {
    return RegExp(r"^1([3456789])\d{9}$").hasMatch(phone);
  }

  /// 验证码验证
  static bool isVerificationCode(String code) {
    return RegExp(r"^\d{6}$").hasMatch(code);
  }
}
