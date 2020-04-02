import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test("RxDart 测试", () {
     Log.d("当前时间 ： ${DateTime.now()}");
     Future.delayed(const Duration(seconds:1), () => print('1秒后在Event queue中运行的Future 当前时间 ： ${DateTime.now()}'));


  });
}
