import 'package:luckin_coffee_demo/common/common.dart';

/// 存储用户 基本信息
class UserInfo {
  static const CACHE_PHONE = "cache_phone";
  static const CACHE_TOKEN = "cache_token";
  static const CACHE_USER_ID = "cache_user_id";
  static const CACHE_LOGIN_TIME = "cache_login_time";
  static UserInfo _instance;

  factory UserInfo() {
    if (_instance == null) _instance = UserInfo._internal();
    return _instance;
  }

  /// 当前用户 手机号
  String _currPhone = "";

  // ignore: unused_field
  DateTime _loginTime = DateTime(2021);

  String get token => Application.sharedP.getString(CACHE_TOKEN);

  set token(String value) {
    Application.sharedP.setString(CACHE_TOKEN, value);
  }

  /// 获取用户 登录状态
  /// 1、上次登录时间是否 大于7天
  bool get isLogin {
    if (currPhone == "") return false;
    if (userId == "") return false;
    if (loginTime.difference(DateTime.now()).inHours >= 7 * 24) return false;
    return true;
  }

  String get currPhone {
    List<String> caches = cachePhones;
    if (caches.length > 0) _currPhone = caches[0];
    return _currPhone;
  }

  set currPhone(String value) => savePhone(value);

  UserInfo._internal();

  /// 緩存 输入过的 手机号。保存最新的三个
  savePhone(String phone) {
    List<String> localData = cachePhones;
    localData.insert(0, phone);
    if (localData.length > 3) localData.sublist(0, 2);
    Application.sharedP.setStringList(CACHE_PHONE, localData).then((isSuccess) {
      log.d("本地数据保存${isSuccess ? '成功' : '失败'}");
    });
  }

  List<String> get cachePhones {
    var res = Application.sharedP.getStringList(CACHE_PHONE);
    return res ?? [];
  }

  String get userId => Application.sharedP.getString(CACHE_USER_ID);

  set userId(String value) {
    Application.sharedP.setString(CACHE_USER_ID, value);
  }

  DateTime get loginTime {
    int milliseconds = Application.sharedP.getInt(CACHE_LOGIN_TIME);
    if (milliseconds == null)
      milliseconds = DateTime(2020).millisecondsSinceEpoch;
    return _loginTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  set loginTime(DateTime value) {
    Application.sharedP.setInt(CACHE_LOGIN_TIME, value.millisecondsSinceEpoch);
    _loginTime = value;
  }
}
