import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/global.dart';
import 'package:luckin_coffee_demo/data_provider/service/imp/app_service_imp.dart';

void main() {
  test("AppServiceImp", () async {
    await AppServiceImp().getAppVersion("1597818873300545668").then((value) {
      log.d("成功："+value.toString());
    }, onError: (err) {
      log.e("失败："+err.toString());
    }).whenComplete(() => log.d("请求结束！"));
  });
}
