import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:luckin_coffee_demo/common/common.dart';

void main() {
  var menuItemData = [
    {
      "title": "现在下单",
      "subTitles": "ORDER NOW",
      "icon": "lib/assets/images/home/icon_coffee_cup.png"
    },
    {
      "title": "咖啡钱包",
      "subTitles": "COFFRR WALLET",
      "icon": "lib/assets/images/home/icon_coffee_wallet.png"
    },
    {
      "title": "送Ta咖啡",
      "subTitles": "SEND COFFEE",
      "icon": "lib/assets/images/home/icon_coffee_gift.png"
    },
    {
      "title": "企业账户",
      "subTitles": "SENTERPRISEACCOUNT",
      "icon": "lib/assets/images/home/icon_coffee_account.png"
    },
  ];
  test("description", () async {
   await Stream.fromIterable(menuItemData)
        .map((event) => event["title"])
        .toList()
        .then((value) => log.d("$value"));

    // Future forEacha = await Future.forEach(menuItemData, (element) {
    //   log.d("Future.forEach = $element");
    //   return Future.value(element["title"]);
    // });
    // forEacha.then((value) {
    //   return value;
    // });
    // await Future.wait().then((value) => )
  });
}
