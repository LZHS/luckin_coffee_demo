import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common.dart';

void main() {
  test("description ", () async {
    Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (e)=>e);
    stream = stream.take(5);

    StreamController sc = StreamController<int>();
    // 将 Stream 传入
    sc.addStream(stream);
    // 监听
   await sc.stream.forEach((element) =>print);
  });
}
