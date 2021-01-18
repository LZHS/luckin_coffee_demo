import 'package:luckin_coffee_demo/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 存储用户 基本信息
class UserInfo {
  // ignore: non_constant_identifier_names
  final CACHE_PHONE = "cachePhone";
  static UserInfo _instance;
  SharedPreferences _sharedP;

  factory UserInfo() {
    if (_instance == null) _instance = UserInfo._internal();
    return _instance;
  }

  /// 当前用户 手机号
  String _currPhone = "";

  String token ="";

  String get currPhone {
    List<String> caches = cachePhones;
    if (caches.length > 0) _currPhone = caches[0];
    return _currPhone;
  }

  set currPhone(String value) => savePhone(value);

  UserInfo._internal() {
    SharedPreferences.getInstance()
        .then((sharedPreferences) => _sharedP = sharedPreferences);
  }

  /// 緩存 输入过的 手机号。保存最新的三个
  savePhone(String phone) {
    List<String> localData = cachePhones;
    localData.insert(0, phone);
    if (localData.length > 3) localData.sublist(0, 2);
    _sharedP.setStringList(CACHE_PHONE, localData).then((isSuccess) {
      log.d("本地数据保存${isSuccess ? '成功' : '失败'}");
    });
  }

  List<String> get cachePhones => _sharedP.getStringList(CACHE_PHONE);
}
