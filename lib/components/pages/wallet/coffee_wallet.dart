import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common/common_utils.dart';
import 'package:flutter_demo/common/widgets/head_title_bar.dart';
import 'package:flutter_demo/components/pages/wallet/beans/coffee_wallet_item.dart';

///```
/// 咖啡钱包 页面
///```
class CoffeeWallet extends StatefulWidget {
  @override
  _CoffeeWalletState createState() => _CoffeeWalletState();
}

class _CoffeeWalletState extends State<CoffeeWallet> {
  List<CoffeeWalletItem> itemDatas = new List();
  
  _CoffeeWalletState() {
    getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(
        title: "咖啡钱包",
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }

  void getAllItems() {
    //TODO 20.02.25 获取钱包内的数据并展示出来
    // rootBundle
    //     .loadString("lib/assets/datas/coffeeWalletList.json")
    //     .then((valStr) {
    //   itemDatas.clear();
    //   Map<String, dynamic> tempItem = json.decode(valStr);
    //   tempItem.forEach(
    //       (key, item) => itemDatas.add(CoffeeWalletItem.fromJson(item)));
    // });
    // itemDatas.forEach((item)=>Log.d("${item.toString()}"));
  }
}
