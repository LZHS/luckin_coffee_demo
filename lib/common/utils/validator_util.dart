/// 校验工具类
class ValidatorUtil {
  /// 正则表达式：验证用户名
  static final String regexUserName = r"^[a-zA-Z]\w{5,20}$";

  /// 正则表达式：验证密码
  static final String regexPassword = r"^[a-zA-Z0-9]{6,20}$";

  ///  正则表达式：验证手机号
  static final String regexMobile =
      r"^(13[0-9]|14[01456879]|15[0-3,5-9]|16[2567]|17[0-8]|18[0-9]|19[0-3,5-9])\d{8}$";

  ///正则表达式：验证邮箱
  static final String regexEmail =
      r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$";

  /// 正则表达式：验证汉字
  static final String regexChinese = r"^[\u4e00-\u9fa5]{0,}$";

  /// 正则表达式：验证身份证
  static final String regexIdCard = r"(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)";

  /// 正则表达式：验证URL
  static final String regexUrl =
      r"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?";

  /// 正则表达式：验证IP地址
  static final String regexIpAddr =
      r"^((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}$";

  ///校验用户名
  static bool isUserName(String username) {
    return RegExp(regexUserName).hasMatch(username);
  }

  /// 校验密码
  static bool isPassword(String password) {
    return RegExp(regexPassword).hasMatch(password);
  }

  ///校验手机号
  static bool isMobile(String mobile) {
    return RegExp(regexMobile).hasMatch(mobile);
  }

  /// 校验邮箱
  static bool isEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }

  /// 校验汉字
  static bool isChinese(String chinese) {
    return RegExp(regexChinese).hasMatch(chinese);
  }

  /// 校验身份证
  static bool isIDCard(String idCard) {
    // 校验长度
    if (RegExp(regexIdCard).hasMatch(idCard)) {
      if (_checkProv(idCard.substring(0, 2))) {
        if (idCard.length == 15) idCard = _trans15bitTo18bit(idCard);
        var date = idCard.substring(6, 14);
        if (checkDate(date)) return _checkCode(idCard);
      }
    }
    return false;
  }

  /// 将 15 位 身份证 转换为 18位
  static String _trans15bitTo18bit(String idCard) {
    //1. 两位年份填充为四位；2. 生成最后一位校验位；

    //年份最后两位小于17,年份为20XX，否则为19XX
    if (int.parse(idCard.substring(6, 8)) <= 17)
      idCard =
          idCard.substring(0, 6) + "20" + idCard.substring(6, idCard.length);
    else
      idCard =
          idCard.substring(0, 6) + "19" + idCard.substring(6, idCard.length);

    var factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    var parity = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
    //生成最后一位校验位
    var sum = 0;
    for (var i = 0; i < idCard.length; i++) {
      sum += int.parse(idCard[i]) * factor[i];
    }
    idCard += parity[sum % 11];
    return idCard;
  }

  /// 身份证 省级地址码校验
  static bool _checkProv(val) {
    var pattern = RegExp(r"^[1-9][0-9]");
    var provs = {
      '11': "北京",
      '12': "天津",
      '13': "河北",
      '14': "山西",
      '15': "内蒙古",
      '21': "辽宁",
      '22': "吉林",
      '23': "黑龙江 ",
      '31': "上海",
      '32': "江苏",
      '33': "浙江",
      '34': "安徽",
      '35': "福建",
      '36': "江西",
      '37': "山东",
      '41': "河南",
      '42': "湖北 ",
      '43': "湖南",
      '44': "广东",
      '45': "广西",
      '46': "海南",
      '50': "重庆",
      '51': "四川",
      '52': "贵州",
      '53': "云南",
      '54': "西藏 ",
      '61': "陕西",
      '62': "甘肃",
      '63': "青海",
      '64': "宁夏",
      '65': "新疆",
      '71': "台湾",
      '81': "香港",
      '82': "澳门"
    };
    if (pattern.hasMatch(val)) {
      if (provs[val] != null) {
        return true;
      }
    }
    return false;
  }

  /// 身份证 校验码校验
  static bool _checkCode(String code) {
    var factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    var parity = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
    var codeLength = code.length - 1;
    var tempCode = code.substring(0, codeLength);
    var sum = 0;
    for (var i = 0; i < codeLength; i++) {
      sum += int.parse(tempCode[i]) * factor[i];
    }
    if (parity[sum % 11] == code.substring(codeLength).toUpperCase()) {
      return true;
    }
    return false;
  }

  ///出生日期码校验
  static bool checkDate(val) {
    var pattern = RegExp(
        r"^((([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))0229))$");
    return pattern.hasMatch(val);
  }

  /// 校验URL
  static bool isUrl(String url) {
    return RegExp(regexUrl).hasMatch(url);
  }

  /// 校验IP地址
  static bool isIPAddr(String ipAddr) {
    return RegExp(regexIpAddr).hasMatch(ipAddr);
  }
}
