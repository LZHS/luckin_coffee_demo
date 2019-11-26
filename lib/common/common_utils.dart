const bool kReleaseMode =
    bool.fromEnvironment('dart.vm.product', defaultValue: false);

/// Log Util.
class Log {
  static const String _TAG_DEF = "### flutter - log ###";

  static bool debuggable = !kReleaseMode; //是否是debug模式,true: log v 不输出.
  static String TAG = _TAG_DEF;

  static void init({bool isDebug = false, String tag = _TAG_DEF}) {
    debuggable = isDebug;
    TAG = tag;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, '  e  ', object);
  }

  static void v(Object object, {String tag}) {
    if (debuggable) _printLog(tag, '  v  ', object);
  }

  static void d(Object object, {String tag}) {
    if (debuggable) _printLog(tag, '  d  ', object);
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