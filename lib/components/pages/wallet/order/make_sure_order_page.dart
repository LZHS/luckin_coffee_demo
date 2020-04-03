import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luckin_coffee_demo/common/common_utils.dart';
import 'package:luckin_coffee_demo/common/widgets/head_title_bar.dart';
import 'package:luckin_coffee_demo/components/pages/wallet/beans/coffee_wallet_item.dart';

/// 确认订单页面
class MakeSureOrderPage extends StatefulWidget {
  final String productListStr;
  List<CoffeeWalletItem> productList = [];

  MakeSureOrderPage({Key key, this.productListStr})
      : assert(productListStr.isNotEmpty),
        super(key: key) {
    jsonDecode(productListStr).forEach((element) {
      productList.add(CoffeeWalletItem.fromJson(element));
    });
  }

  @override
  _MakeSureOrderPageState createState() => _MakeSureOrderPageState();
}

class _MakeSureOrderPageState extends State<MakeSureOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadTitleBar(title: "确认订单"),
      body: SafeArea(
        child: Container(
          //TODO 这里将要完成 确认订单页面布局
        ),
      ),
    );
  }
}
