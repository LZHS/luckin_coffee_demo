// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {});

  test("测试 RxDart", () {
    Stream.fromIterable([0,1,2,6])
    .debounceTime(Duration(seconds:1))
    .listen((data)=>Log.d("值 ：$data"));
    
  });
}
