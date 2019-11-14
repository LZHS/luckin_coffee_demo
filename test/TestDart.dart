import 'package:flutter_demo/common_utils.dart';
import 'package:flutter_demo/test_demo/1911/191114/helpers/color_helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test Log', () {
    Log.d("#aaa12bc3 = ${ColorHelpers.fromHexString("#aaa12bc3")}");
    Log.d("0xaaa12bc3 = ${ColorHelpers.fromHexString("0xaaa12bc3")}");
    Log.d("#a12bc3 = ${ColorHelpers.fromHexString("#a12bc3")}");
 
  });
}

//flutter pub  run test ../test/TestDart.dart

