import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';

void main() {
  test("异步操作测试", () {
    print("打开烧水开关");
    Water(0).heat().then((water){
      print('水已经烧开,现在温度:${water.temperature},开始冲水');
    });
    print("扫地");

  });
}

class Water {
  double temperature;

  Water(this.temperature);

  Future<Water> heat() {
    temperature = 100;
    return Future<Water>(() => this);
  }
}

class TestList {
  void runMap() {
    var testData = ["香蕉", "苹果", "可乐", "瓜子", "矿泉水"];

    var tempData = testData.map((item) {
      Log.d(item);
      return item * 2;
    });
    tempData.forEach((item) => Log.d("tempData : $item"));
  }
}
