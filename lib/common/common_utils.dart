import 'package:flutter/material.dart';

const bool kReleaseMode =
    bool.fromEnvironment('dart.vm.product', defaultValue: false);

///```
/// 日志工具类
///```
class Log { 
  static const String _TAG_DEF = "### flutter - log ###";

  static bool debuggable = !kReleaseMode; //是否是debug模式,true: log v 不输出.
  static String TAG = _TAG_DEF;

  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, '  E  ', object);
  }

  static void v(Object object, {String tag}) {
    if (debuggable) _printLog(tag, '  V  ', object);
  }

  static void d(Object object, {String tag}) {
    if (debuggable) _printLog(tag, '  D  ', object);
  }

  static void _printLog(String tag, String stag, Object object) {
    String da = object.toString();
    while (da.isNotEmpty) {
      da = "  " +
          ((tag == null || tag.isEmpty) ? TAG : tag) +
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
