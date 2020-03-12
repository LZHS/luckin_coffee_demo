import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/fluro/common.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_bottom_menu.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/widgets/wallet_info_item_widget.dart';
import 'package:luckin_coffee_demo/config/Routes.dart';
import 'package:luckin_coffee_demo/config/application.dart';
import 'package:luckin_coffee_demo/config/res/colors.dart';

/// 咖啡钱包详情页面
// ignore: must_be_immutable
class CoffeeWalletInfo extends StatefulWidget {
  CoffeeWalletItem item;

  CoffeeWalletInfo(String itemJson) {
    this.item = CoffeeWalletItem.fromJson(jsonDecode(itemJson));
  }

  @override
  _CoffeeWalletInfoState createState() => _CoffeeWalletInfoState();
}

class _CoffeeWalletInfoState extends State<CoffeeWalletInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "咖啡钱包"),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: Material(
              color: backgroundColor,
              child: Column(
                children: <Widget>[
                  buildItemWidget(),
                ],
              ),
            ),
          ),
          buildBottomWidget(),
        ]),
      ),
    );
  }

  /// 创建底部 菜单按钮
   buildBottomWidget() {
    return WalletBottomMenu();
  }



  /// 创建中间的Item
  buildItemWidget() {
    return  WalletInfoItemWidget(this.widget.item);
  }

 
}
