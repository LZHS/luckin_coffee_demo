import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_bottom_menu.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_widget.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';

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
        child: Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                  child: GridView.builder(
                    itemCount: itemDatas.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.6),
                    itemBuilder: (context, index) =>
                        WalletWidget(itemDatas[index], onClickCallBack),
                  ))),
          WalletBottomMenu()
        ]),
      ),
    );
  }

  /// item 点击 返回数据
  onClickCallBack(CoffeeWalletItem itemBean) {
    Log.d(" 咖啡钱包 点击返回 \n ${itemBean.toString()}");
    Application.router.navigateTo(
        context, "$walletInfo?itemBean=${jsonEncode(itemBean)}",
        transition: TransitionType.inFromRight);
  }

  void getAllItems() {
    rootBundle
        .loadString("lib/assets/datas/coffeeWalletList.json")
        .then((valStr) {
      itemDatas.clear();
      var tempItem = json.decode(valStr);
      tempItem
          .forEach((item) => itemDatas.add(CoffeeWalletItem.fromJson(item)));
      setState(() {});
    });
  }
}
