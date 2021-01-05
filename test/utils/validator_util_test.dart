import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common.dart';

void main() {
  group("ValidatorUtil 方法测试", () {
    test("校验用户名 isUsername", () {
      var testVal = "qwerQWER";
      expect(ValidatorUtil.isUserName(testVal), true);
    });
    test("校验密码 isPassword", () {
      var testVal = "QWERqwer1234";
      expect(ValidatorUtil.isPassword(testVal), true);
    });
    test("校验手机号 isMobile", () {
      var testVal = "18399432915";
      expect(ValidatorUtil.isMobile(testVal), true);
    });
    test("校验邮箱 isEmail", () {
      var testVal = "1154629587@qq.com";
      expect(ValidatorUtil.isEmail(testVal), true);
    });
    test("校验汉字 isChinese", () {
      var testVal = "校验汉字";
      expect(ValidatorUtil.isChinese(testVal), true);
    });
    test("校验身份证 isIDCard", () {
    // var testVal = "11010519491231002X";
    //   var testVal = "450111720930333";
      var testVal = "632123820927051";
      expect(ValidatorUtil.isIDCard(testVal), true);
    });
    test("出生日期码校验 checkDate", () {
      var testVal = "20040229";
      expect(ValidatorUtil.checkDate(testVal), true);
    });
    test("校验URL isUrl", () {
      var testVal = "https://www.baidu.com/";
      expect(ValidatorUtil.isUrl(testVal), true);
    });
    test("校验IP地址 isIPAddr", () {
      var testVal = "39.156.69.79";
      expect(ValidatorUtil.isIPAddr(testVal), true);
    });
  });
}