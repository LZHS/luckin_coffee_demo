import 'package:fluttertoast/fluttertoast.dart';
import 'package:luckin_coffee_demo/common/utils/log.dart';

//const String BASE_URL = "http://127.0.0.1:8080/luckin/";
const String BASE_URL = "http://47.110.55.76:8080/luckin/";

/// 本地数据库 名称
const String DATA_BASE_NAME = "LuckinCoffee.db";

/// 本地数据库 版本
const int DATA_BASE_CURRENT_VERSION = 1;

final log = Log();

showToast(String msg) {
  if (msg.isEmpty) return;
  Fluttertoast.showToast(msg: msg);
}

class Global {
  // ignore: non_constant_identifier_names
  static final APP_ID = "1597818873300545668";

  static final TIMER_TICKS=15;
}
