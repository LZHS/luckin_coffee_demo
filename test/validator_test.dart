
import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';

void main(){

  test("验证 正则表达式", (){
    Log.d(' 13699432975 结果${ValidatorUtil.isVerificationCode("13699432975")}');
    Log.d(' null 结果${ValidatorUtil.isVerificationCode("null")}');
    Log.d(' 18349295925 结果${ValidatorUtil.isVerificationCode("18349295925")}');
    Log.d(' 183492 结果${ValidatorUtil.isVerificationCode("183492")}');
  });
}